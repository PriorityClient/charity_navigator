module CharityNavigator
  class Configuration
    attr_accessor :app_id
    attr_accessor :app_key

    def initialize
      @app_id = nil
      @app_key = nil
    end
  end

end
