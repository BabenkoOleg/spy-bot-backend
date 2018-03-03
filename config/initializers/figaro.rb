Figaro.application = Figaro::Application.new(
  environment: :production,
  path: File.expand_path('../../application.yml', File.dirname(__FILE__))
)
Figaro.load
