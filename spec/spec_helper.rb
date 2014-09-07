require 'bundler/setup'
Bundler.setup

require 'omniauth-etrade'

require 'rspec'
require 'rspec/mocks'
require 'rack/test'
require 'webmock/rspec'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include WebMock::API
  config.include Rack::Test::Methods
  config.extend  OmniAuth::Test::StrategyMacros, :type => :strategy
end
