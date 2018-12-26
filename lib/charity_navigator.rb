require 'charity_navigator/version'
require 'charity_navigator/configuration'
require 'charity_navigator/search'

module CharityNavigator

  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def self.search(opts={})
    Search.new(opts).perform!
  end

  def self.base_url
    "https://api.data.charitynavigator.org/v2"
  end

  def self.auth_params
    {
      app_id: configuration.app_id,
      app_key: configuration.app_key
    }
  end

end
