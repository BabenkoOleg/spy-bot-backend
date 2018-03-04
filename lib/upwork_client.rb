require 'upwork/api/routers/auth'
require 'upwork/api/routers/jobs/search'
require 'upwork/api/routers/metadata'

class UpworkClient
  class << self
    attr_reader :config

    def find_jobs(filter)
      Upwork::Api::Routers::Jobs::Search.new(client).find(filter)
    end

    def get_skills
      Upwork::Api::Routers::Metadata.new(client).get_skills
    end

    def config=(object)
      @config = Upwork::Api::Config.new(object)
    end

    private

    def client
      @client ||= Upwork::Api::Client.new(self.config)
    end
  end
end
