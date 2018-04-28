module SpyBot
  module Config
    extend self

    # the configuration object for SpyBot::ApiClient::Upwork
    attr_accessor :upwork_api_client_config

    # the access token for SpyBot::ApiClient::Slack
    attr_accessor :slack_api_client_token
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
