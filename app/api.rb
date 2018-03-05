class API < Sinatra::Base
  get '/start-observation' do
    Observation.create(
      q: params[:q],
      title: params[:title],
      skills: params[:skills],
      category: params[:category],
      subcategory: params[:subcategory]
    ).values.to_json
  end

  get '/start-redis' do
    DetectionWorks.perform_in(ENV['sidekiq_job_interval'])
  end

  get '/get-skills' do
    UpworkClient.get_skills.to_json
  end
end

