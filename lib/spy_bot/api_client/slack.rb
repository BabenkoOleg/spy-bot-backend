module SpyBot
  module ApiClient
    class Slack
      class << self
        def send_job_notifications(job)
          client.chat_postMessage(
            channel: SpyBot.config.slack_api_client_channel,
            text: job.to_message,
            as_user: true,
            unfurl_links: false,
            unfurl_media: false,
            attachments: [
              {
                fallback: 'Open the job on Upwork',
                actions: [
                  {
                    type: 'button',
                    text: 'Open the job on Upwork',
                    url: job.url,
                    style: 'primary'
                  }
                ]
              }
            ]
          )
        end

        def client
          return @client if @client.present?

          @client = ::Slack::Web::Client.new(token: SpyBot.config.slack_api_client_token)
        end
      end
    end
  end
end
