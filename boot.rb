require 'rubygems'
require 'bundler/setup'
require 'logger'
require 'yaml'
require 'telegram/bot'

Bundler.require

Dir[File.join(File.dirname(__FILE__), 'lib', '*.rb')].each { |file| require file }

%w[figaro sequel clients].each { |file| require "./config/initializers/#{file}" }

Dir[File.join(File.dirname(__FILE__), 'app', 'models', '*.rb')].each { |file| require file }
Dir[File.join(File.dirname(__FILE__), 'app', 'jobs', '*.rb')].each { |file| require file }
