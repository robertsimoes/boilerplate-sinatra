# frozen_string_literal: true

require 'rack/test'
require 'rspec'
require './app'

ENV['RACK_ENV'] ||= 'test'
ENV['APP_ENV'] ||= 'test'

module RSpecMixin
  include Rack::Test::Methods
  def app
    @app ||= Application.new
  end
end

RSpec.configure do |config|
  config.include RSpecMixin

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.warnings = true
  config.shared_context_metadata_behavior = :apply_to_host_groups
end
