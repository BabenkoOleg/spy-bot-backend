module SpyBot
  module ApiClient
    class Slack
      class << self
        def send_job_notifications(job)
          client.chat_postMessage(
            channel: SpyBot.config.slack_api_client_channel,
            text: job.to_message,
            as_user: true,
            unfurl_links: true,
            unfurl_media: true,
            attachments: [
              {
                fallback: 'Open the job on the site',
                actions: [
                  {
                    type: 'button',
                    text: 'Open the job on the site',
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