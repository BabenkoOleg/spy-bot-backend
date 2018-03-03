require 'sinatra'
require 'sequel'
require 'logger'
require 'yaml'
require 'figaro'

require './config/figaro.rb'
require './config/sequel.rb'

require './app/api.rb'

run API
