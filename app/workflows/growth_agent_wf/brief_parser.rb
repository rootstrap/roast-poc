
# frozen_string_literal: true

class BriefParser < Roast::Workflow::BaseStep
  def call
    mock_input = false

    slack_input = workflow.pre_processing_data&.slack_input
    
    return mocked_data if mock_input || !slack_input

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

  def mocked_data
    {
      roles: ["Backend Developer"],
      stack: ["Ruby on Rails", "PostgreSQL"],
      brief: "Desarrollar una app móvil de salud mental",
      briefParsed: "Project brief: Desarrollar una app móvil de salud mental\nroles required: Backend Developer\nstack required: Ruby on Rails"
    }
  end
end
