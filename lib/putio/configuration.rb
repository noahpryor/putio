module Putio
  class Configuration
    attr_accessor :application_secret, :client_id, :base_url

    def initialize
      @application_secret = nil
      @client_id = nil
      @base_url = "https://api.put.io/v2/"
    end

  end
end
