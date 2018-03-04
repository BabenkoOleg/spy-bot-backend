require 'sidekiq'

class DetectionWorks
  include Sidekiq::Worker

  def perform()
    Observation.all.each do |observation|
      jobs = UpworkClient.find_jobs(observation.to_filter)['jobs']

      existing = Job.where(upwork_id: jobs.map { |job| job['id'] }).select_map(:upwork_id)
      jobs.reject! { |job| existing.include?(job['id']) }

      jobs.each do |job|
        next if Job.find(upwork_id: job['id'])

        job = Job.create(
          title: job['title'],
          budget: job['budget'],
          snippet: job['snippet'],
          job_type: job['job_type'],
          duration: job['duration'],
          upwork_id: job['id'],
          job_status: job['job_status'],
          created_at: DateTime.parse(job['date_created']),
        )

        TelegramClient.send_message(job.to_message)
      end

      sleep 1
    end

    self.class.perform_in(ENV['sidekiq_job_interval'])
  end
end
