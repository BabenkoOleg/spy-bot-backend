class CheckNewJobs
  include Sidekiq::Worker
  sidekiq_options queue: 'spy-bot', retry: false

  def perform
    jobs = YAML.load_file('./config/search.yml').map do |filter|
      logger.info "Search by: #{filter.to_s}"
      SpyBot::ApiClient::Upwork.find_jobs(filter)
    end

    jobs = jobs.flatten.uniq { |job| job['id'] }

    already_exist_ids = Job.where(upwork_id: jobs.map { |job| job['id'] }).select_map(:upwork_id)
    jobs.reject! { |data| already_exist_ids.include?(data['id']) }

    jobs.map! do |data|
      Job.create(
        url: data['url'],
        title: data['title'],
        skills: (data['skills'] || []).join(', '),
        budget: data['budget'],
        snippet: data['snippet'],
        job_type: data['job_type'],
        duration: data['duration'],
        category: data['category2'],
        upwork_id: data['id'],
        job_status: data['job_status'],
        created_at: DateTime.parse(data['date_created'])
      )
    end

    jobs.each { |job| SpyBot::ApiClient::Slack.send_job_notifications(job) }

    logger.info "Found new jobs: #{jobs.count}"
  end
end



