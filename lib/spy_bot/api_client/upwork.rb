require 'upwork/api/routers/auth'
require 'upwork/api/routers/jobs/search'

module SpyBot
  module ApiClient
    class Upwork
      class << self
        def find_jobs(filter)
          jobs = ::Upwork::Api::Routers::Jobs::Search.new(client).find(searching_filter(filter))['jobs']

          pf = processing_filter(filter)
          jobs.reject! { |data| data['skills'] & pf['skills'].split(',') } if pf['skills'].present?

          jobs
        end

        def client
          return @client if @client.present?

          config = ::Upwork::Api::Config.new(SpyBot.config.upwork_api_client_config)
          ::Upwork::Api::Client.new(config)
        end

        def searching_filter(filter)
          filter['searching_filter'].select { |k, v| !v.nil? }
        end

        def processing_filter(filter)
          filter['processing_filter'].select { |k, v| !v.nil? }
        end
      end
    end
  end
end
