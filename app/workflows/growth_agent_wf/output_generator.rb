# frozen_string_literal: true

class OutputGenerator < Roast::Workflow::BaseStep
  def call
    pod_structure = workflow.output["pod_generator"]
    brief_data = workflow.output["brief_parser"]
    
    return { output: "❌ No profiles found." } if pod_structure[:profiles].empty?
    
    output_text = format_output(pod_structure)
    puts output_text  # Keep logs
    
    # Send to Slack if we have slack context
    if brief_data && brief_data[:slack_context]
      send_to_slack(output_text, brief_data[:slack_context])
      { output: "✅ Slack message sent successfully!" }
    else
      { output: output_text }  # Fallback for console usage
    end
  end

  private

  def format_output(pod_structure)
    output = []
    
    output << "\n🚀 #{pod_structure[:title]}"
    output << "="*60
    output << ""
    
    pod_structure[:profiles].each_with_index do |profile, index|
      output << "#{index + 1}. #{profile[:name]} - #{profile[:role]}"
      output << "   #{profile[:description]}"
      output << ""
    end
    
    output << "✅ Pod created with #{pod_structure[:profiles].length} members"
    output << ""
    
    output.join("\n")
  end
  
  def send_to_slack(message, slack_context)
    return unless defined?(SLACK_CLIENT)
    
    begin
      SLACK_CLIENT.chat_postMessage(
        channel: slack_context[:channel_id],
        text: message
      )
      Rails.logger.info "Message sent to Slack channel #{slack_context[:channel_id]}"
    rescue => e
      Rails.logger.error "Failed to send message to Slack: #{e.message}"
    end
  end
end
