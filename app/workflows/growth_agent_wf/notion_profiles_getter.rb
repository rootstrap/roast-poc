
# frozen_string_literal: true
require_relative '../../services/notion_client'

class NotionProfilesGetter < Roast::Workflow::BaseStep
  def call
    notion_profiles = fetch_notion_profiles
    parsed_profiles = notion_profiles.map { |profile|
      { name: profile[:name], role: profile[:role], stacks: (profile[:tags] || []).join(', ') }.to_json
    }.join('***')
    {
      notion_profiles: parsed_profiles,
      response: { notionProfiles: notion_profiles }
    }
  end

  private

  def fetch_notion_profiles
    client = NotionClient.new
    profiles = client.fetch_profiles
    profiles
  end
end
