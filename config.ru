require 'sinatra'
require 'sequel'
require 'logger'
require 'yaml'
require 'figaro'

require './config/initializers/figaro.rb'
require './config/initializers/sequel.rb'

require './app/api.rb'

run API
