require 'rubygems'
require 'bundler/setup'
require 'logger'
require 'yaml'

Bundler.require

Dir[File.join(File.dirname(__FILE__), 'lib', '*.rb')].each { |file| require file }

%w[figaro sequel clients].each { |file| require "./config/#{file}" }

Dir[File.join(File.dirname(__FILE__), 'app', 'models', '*.rb')].each { |file| require file }
