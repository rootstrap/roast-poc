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
    
    # TODO: Phase 2 will integrate with workflow
    respond_to_direct_message(event)
  end

  def respond_to_direct_message(event)
    return unless defined?(SLACK_CLIENT)
    
    SLACK_CLIENT.chat_postMessage(
      channel: event['channel'],
      text: "Hi there! I received your direct message. Slack integration is working! 🚀\n" \
            "Full workflow integration coming in Phase 2."
    )
  rescue => e
    Rails.logger.error "Failed to respond to DM: #{e.message}"
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
