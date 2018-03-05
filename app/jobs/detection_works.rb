require 'sidekiq'

class DetectionWorks
  include Sidekiq::Worker
  sidekiq_options queue: 'spy-bot'

  def perform
    Observation.all.each do |observation|
      jobs = UpworkClient.find_jobs(observation.to_filter)['jobs']

      existing = Job.where(upwork_id: jobs.map { |job| job['id'] }).select_map(:upwork_id)
      jobs.reject! { |job_data| existing.include?(job_data['id']) }

      jobs.each do |job_data|
        next if Job.find(upwork_id: job_data['id'])

        job = Job.create(
          url: job_data['url'],
          title: job_data['title'],
          budget: job_data['budget'],
          snippet: job_data['snippet'],
          job_type: job_data['job_type'],
          duration: job_data['duration'],
          upwork_id: job_data['id'],
          job_status: job_data['job_status'],
          created_at: DateTime.parse(job_data['date_created']),
        )

        TelegramClient.send_message(job.to_message)
      end

      sleep 1
    end

    self.class.perform_in(ENV['sidekiq_job_interval'])
  end
end
