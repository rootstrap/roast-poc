
# frozen_string_literal: true
require 'json'

class ProfileFilterParser < Roast::Workflow::BaseStep
  def call
    response = workflow.output["profile_filter_prompt"]["profiles"]

    matching_names = response.map { |match| match["name"] }

    profiles_data = workflow.output["mock_notion_profiles_getter"]&.dig("response", :notionProfiles) || 
                   workflow.output["notion_profiles_getter"]&.dig("response", :notionProfiles)
    
    filtered_names = profiles_data.filter do |profile|
      matching_names.include?(profile[:name])
    end

    filtered_names
  end
end
