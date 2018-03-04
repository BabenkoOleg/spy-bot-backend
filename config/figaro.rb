Figaro.application = Figaro::Application.new(
  environment: :production,
  path: File.expand_path('../config.yml', File.dirname(__FILE__))
)
Figaro.load
