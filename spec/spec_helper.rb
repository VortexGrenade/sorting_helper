require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

ENV['RAILS_ENV'] = 'test'

require File.expand_path('../dummy/config/environment.rb',  __FILE__)
require 'rspec/rails'

require 'dummy/app/controllers/application_controller'
require 'dummy/config/routes'

RSpec.configure do |config|
  config.order = 'random'
end
