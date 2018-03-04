require './boot'
require './app/api'
require 'sidekiq/web'

run Rack::URLMap.new(
  '/' => API,
  '/sidekiq' => Sidekiq::Web
)
