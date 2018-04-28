SpyBot.configure do |config|
  config.upwork_api_client_config = {
    'consumer_key'     => ENV['upwork_api_consumer_key'],
    'consumer_secret'  => ENV['upwork_api_consumer_secret'],
    'access_token'     => ENV['upwork_api_access_token'],
    'access_secret'    => ENV['upwork_api_access_secret'],
    'signature_method' => ENV['upwork_api_signature_method'],
  }

  config.slack_api_client_token = ENV['slack_api_client_token']
end
