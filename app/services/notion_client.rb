# frozen_string_literal: true

require 'faraday'
require 'json'

class NotionClient
  NOTION_API_URL = 'https://api.notion.com/v1/databases'.freeze
  NOTION_VERSION = '2022-06-28'.freeze

  def initialize(api_key: ENV['NOTION_API_KEY'], database_id: ENV['NOTION_DATABASE_ID'])
    @api_key = api_key
    @database_id = database_id
  end

  def fetch_profiles
    raise 'Missing Notion API credentials' unless @api_key && @database_id

    response = Faraday.post(
      "#{NOTION_API_URL}/#{@database_id}/query",
      {}.to_json,
      {
        'Authorization' => "Bearer #{@api_key}",
        'Notion-Version' => NOTION_VERSION,
        'Content-Type' => 'application/json'
      }
    )
    raise "Notion API error: #{response.status}" unless response.success?
    data = JSON.parse(response.body)
    map_profiles(data)
  rescue => e
    Rails.logger.error("NotionClient error: #{e.message}")
    nil
  end

  private

  def map_profiles(data)
    results = data['results'] || []
    results.map do |row|
      props = row['properties']
      {
        location: props.dig('Location', 'select', 'name'),
        name: props.dig('Name', 'title', 0, 'plain_text'),
        englishLevel: props.dig('English Level', 'select', 'name'),
        linkBios: props.dig('Editable Bio Link', 'rich_text', 0, 'plain_text'),
        role: props.dig('Role', 'select', 'name'),
        department: format_multi_select(props['Department']),
        previousProjects: format_multi_select(props['Previous Projects']),
        tags: format_multi_select(props['Tags']),
        industries: format_multi_select(props['Industries']),
        seniority: format_multi_select(props['Seniority']),
        mainSkills: format_multi_select(props['Main Skill(s)'])
      }
    end
  end

  def format_multi_select(column)
    return [] unless column && column['multi_select']
    column['multi_select'].map { |opt| opt['name'] }
  end
end 