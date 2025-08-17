# frozen_string_literal: true

class SlackWorkflowJob < ApplicationJob
  queue_as :default

  def perform(slack_input)
    Rails.logger.info "Starting workflow for user #{slack_input[:user_id]}"

    # Execute workflow with Slack input
    # The output_generator will handle sending results to Slack
    workflow = GrowthAgentWorkflow.new
    result = workflow.execute(slack_input: slack_input)

    Rails.logger.info "Workflow completed successfully"

  rescue => e
    Rails.logger.error "Workflow failed: #{e.message}"
    send_error_message(slack_input, e.message)
    raise e
  end

  private

  def send_error_message(slack_input, error_message)
    return unless defined?(SLACK_CLIENT)

    SLACK_CLIENT.chat_postMessage(
      channel: slack_input[:channel_id],
      text: "❌ Sorry, something went wrong: #{error_message}"
    )
  end
end 