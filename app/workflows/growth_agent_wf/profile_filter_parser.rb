
# frozen_string_literal: true
require 'json'

class ProfileFilterParser < Roast::Workflow::BaseStep
  def call
    response = workflow.output["profile_filter_prompt"]["profiles"]

    matching_names = response.map { |match| match["name"] }

    filtered_names = workflow.output["notion_profiles_getter"]["response"][:notionProfiles].filter do |profile|
      matching_names.include?(profile[:name])
    end

    filtered_names
  end
end
