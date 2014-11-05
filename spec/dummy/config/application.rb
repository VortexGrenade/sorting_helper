require File.expand_path('../boot', __FILE__)
require 'action_controller/railtie'
Bundler.require(*Rails.groups)
require 'sorting_helper'

module Dummy
  class Application < Rails::Application
    config.secret_key_base = 'dummy_key'
    config.session_store :cookie_store, key: '_dummy_session'
    config.cache_classes = true
    config.eager_load = false
    config.consider_all_requests_local = true
    config.action_dispatch.show_exceptions = false
    config.action_controller.perform_caching = false
    config.action_controller.allow_forgery_protection = false
    config.active_support.deprecation = :stderr
  end
end
