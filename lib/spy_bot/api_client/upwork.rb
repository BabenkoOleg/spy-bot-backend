require 'upwork/api/routers/auth'
require 'upwork/api/routers/jobs/search'

module SpyBot
  module ApiClient
    class Upwork
      class << self
        def find_jobs(filter)
          searching_filter = filter['searching'].select { |k, v| !v.nil? }
          jobs = ::Upwork::Api::Routers::Jobs::Search.new(client).find(searching_filter)['jobs']

          processing_filter = filter['processing'].select { |k, v| !v.nil? }

          if processing_filter['excepted_skills'].present?
            excepted_skills = processing_filter['excepted_skills'].split(', ')
            jobs.reject! { |data| (data['skills'] & excepted_skills).any? }
          end

          jobs
        end

        def client
          return @client if @client.present?

          config = ::Upwork::Api::Config.new(SpyBot.config.upwork_api_client_config)
          ::Upwork::Api::Client.new(config)
        end
      end
    end
  end
end
