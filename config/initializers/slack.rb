# frozen_string_literal: true

require 'slack-ruby-client'

# Configure Slack client
Slack.configure do |config|
  config.token = ENV['SLACK_BOT_TOKEN']
  config.logger = Rails.logger
end


required_slack_envs = %w[SLACK_BOT_TOKEN SLACK_SIGNING_SECRET]
missing = required_slack_envs.select { |k| ENV[k].nil? || ENV[k].empty? }

if missing.any?
  Rails.logger.warn("[Slack] Missing ENV variables: #{missing.join(', ')}. Slack integration may not work.")
else
  SLACK_CLIENT = Slack::Web::Client.new(token: ENV['SLACK_BOT_TOKEN'])
  Rails.logger.info("[Slack] Client initialized successfully")
end
