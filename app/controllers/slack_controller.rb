# frozen_string_literal: true

class SlackController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :verify_slack_request

  def webhook
    case slack_event['type']
    when 'url_verification'
      render json: { challenge: slack_event['challenge'] }
    when 'event_callback'
      handle_slack_event(slack_event['event'])
      head :ok
    else
      head :ok
    end
  end

  private

  def verify_slack_request
    slack_request = Slack::Events::Request.new(request)
    slack_request.verify!
  rescue Slack::Events::Request::InvalidSignature, 
         Slack::Events::Request::TimestampExpired => e
    Rails.logger.error "Slack verification failed: #{e.message}"
    head :unauthorized
  end

  def slack_event
    @slack_event ||= JSON.parse(request.body.read)
  end

  def handle_slack_event(event)
    Rails.logger.info "Received Slack event: #{event['type']}"
    
    if event['bot_id'] || event['subtype'] == 'bot_message'
      return
    end
    
    if event['user'] == bot_user_id
      return
    end
    
    if event['type'] == 'message' && event['channel_type'] == 'im'
      handle_direct_message(event)
    end
  end

  def handle_direct_message(event)
    Rails.logger.info "Direct message from user #{event['user']}"
    
    user_id = event['user']
    message_text = event['text'].strip
    
    state = SlackConversationService.get_state(user_id)
    
    case state[:step]
    when :start
      handle_start_conversation(event)
    when :brief
      handle_brief_input(event, state, message_text)
    when :roles
      handle_roles_input(event, state, message_text)
    when :stack
      handle_stack_input(event, state, message_text)
    else
      handle_start_conversation(event) # Reset if confused
    end
  end

  def handle_start_conversation(event)
    user_id = event['user']
    
    # Set state to ask for brief
    state = { step: :brief }
    SlackConversationService.set_state(user_id, state)
    
    # Ask for brief
    send_message(event['channel'], SlackConversationService.step_prompt(:brief))
  end

  def handle_brief_input(event, state, message_text)
    user_id = event['user']
    
    # Store brief and move to roles
    state[:brief] = message_text
    state[:step] = :roles
    SlackConversationService.set_state(user_id, state)
    
    # Ask for roles
    send_message(event['channel'], SlackConversationService.step_prompt(:roles))
  end

  def handle_roles_input(event, state, message_text)
    user_id = event['user']
    
    # Store roles and move to stack
    state[:roles_text] = message_text
    state[:step] = :stack
    SlackConversationService.set_state(user_id, state)
    
    # Ask for stack
    send_message(event['channel'], SlackConversationService.step_prompt(:stack))
  end

  def handle_stack_input(event, state, message_text)
    user_id = event['user']
    
    # Store stack and trigger workflow
    state[:stack_text] = message_text
    
    # Build workflow input
    slack_input = SlackInputService.build_workflow_input(
      state[:brief],
      state[:roles_text],
      state[:stack_text],
      user_id,
      event['channel']
    )
    
    # Clear conversation state
    SlackConversationService.clear_state(user_id)
    
    # Trigger workflow
    Rails.logger.info "Triggering workflow for user #{user_id}"
    SlackWorkflowJob.perform_later(slack_input)
  end

  def send_message(channel, text)
    return unless defined?(SLACK_CLIENT)
    
    SLACK_CLIENT.chat_postMessage(
      channel: channel,
      text: text
    )
  rescue => e
    Rails.logger.error "Failed to send message: #{e.message}"
  end

  def bot_user_id
    @bot_user_id ||= begin
      response = SLACK_CLIENT.auth_test
      response.user_id
    rescue => e
      Rails.logger.error "Failed to get bot user ID: #{e.message}"
      nil
    end
  end
end
