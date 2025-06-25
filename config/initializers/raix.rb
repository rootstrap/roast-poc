require 'raix'
require 'dotenv/load'

Raix.configure do |config|
  # Create OpenAI client with explicit configuration and logging
  client = OpenAI::Client.new(
    access_token: ENV['OPENAI_API_KEY'],
    organization_id: nil,
    uri_base: "https://api.openai.com/",
    request_timeout: 240,
    log_requests: true
  )
  
  config.openai_client = client
end 