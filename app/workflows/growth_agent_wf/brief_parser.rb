
# frozen_string_literal: true

class BriefParser < Roast::Workflow::BaseStep
  def call
    slack_input = workflow.pre_processing_data&.slack_input

    return {} unless slack_input

    {
      roles: slack_input[:roles],
      stack: slack_input[:stack], 
      brief: slack_input[:brief],
      briefParsed: format_brief_parsed(slack_input),
      slack_context: {
        user_id: slack_input[:user_id],
        channel_id: slack_input[:channel_id]
      }
    }
  end
  
  private
  
  def format_brief_parsed(slack_input)
    "Project brief: #{slack_input[:brief]}\n" \
    "roles required: #{slack_input[:roles].join(', ')}\n" \
    "stack required: #{slack_input[:stack].join(', ')}"
  end

end
