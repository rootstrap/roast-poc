# frozen_string_literal: true

required_notion_envs = %w[NOTION_API_KEY NOTION_DATABASE_ID]
missing = required_notion_envs.select { |k| ENV[k].nil? || ENV[k].empty? }

if missing.any?
  Rails.logger.warn("[Notion] Missing ENV variables: #{missing.join(', ')}. Notion integration may not work.")
end 