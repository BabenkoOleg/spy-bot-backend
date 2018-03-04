class API < Sinatra::Base
  get '/start-observation' do
    o = Observation.create(
      q: params[:q],
      title: params[:title],
      skills: params[:skills],
      category: params[:category],
      subcategory: params[:subcategory]
    ).values.to_json
  end

  get '/get-skills' do
    UpworkClient.get_skills.to_json
  end
end

