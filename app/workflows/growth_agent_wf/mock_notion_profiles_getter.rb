# frozen_string_literal: true
require_relative 'mock_data'

class MockNotionProfilesGetter < Roast::Workflow::BaseStep
  def call
    notion_profiles = MockData.notion_profiles
    parsed_profiles = notion_profiles.map { |profile|
      { name: profile[:name], role: profile[:role], stacks: (profile[:tags] || []).join(', ') }.to_json
    }.join('***')
    {
      notion_profiles: parsed_profiles,
      response: { notionProfiles: notion_profiles }
    }
  end
end
