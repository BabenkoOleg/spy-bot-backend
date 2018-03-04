UpworkClient.config = {
  'consumer_key' => ENV['upwork_api_consumer_key'],
  'consumer_secret' => ENV['upwork_api_consumer_secret'],
  'access_token' => ENV['upwork_api_access_token'],
  'access_secret' => ENV['upwork_api_access_secret'],
  'signature_method' => 'HMAC-SHA1'
}

TelegramClient.config = {
  access_token: ENV['telegram_bot_token'],
  chat_id: ENV['telegram_bot_chat_id']
}
