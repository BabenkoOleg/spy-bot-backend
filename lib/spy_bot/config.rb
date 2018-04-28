module SpyBot
  module Config
    extend self

    # the configuration object for SpyBot::ApiClient::Upwork
    attr_accessor :upwork_api_client_config

    # the access token and channel ID for SpyBot::ApiClient::Slack
    attr_accessor :slack_api_client_token, :slack_api_client_channel
  end

  class << self

    # A fresh initializer with all configuration values.
    def configure
      yield Config
    end

    def config
      Config
    end
  end
end
