require 'sinatra/base'

class API < Sinatra::Base
  get '/' do
    'It\' working!'
  end
end
