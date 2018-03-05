class TelegramClient
  class << self
    attr_accessor :config

    def send_message(message)
      Telegram::Bot::Client.run(config[:access_token]) do |bot|
        bot.api.send_message(
          chat_id: config[:chat_id],
          text: message,
          parse_mode: 'Markdown',
          disable_web_page_preview: true
        )
      end
    end
  end
end
