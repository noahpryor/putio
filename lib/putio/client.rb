require 'httparty'
module Putio
  class Client
    include HTTParty
    base_uri "https://api.put.io/v2"
    def initialize(user_token)
      @auth = {:query =>{:oauth_token=> user_token},:headers => {"Accept:" => "application/json"}}
      @options = {}
    end

    def files
      get_endpoint("/files/list")["files"]
    end
    def search(options)
    end

    def get_endpoint(endpoint,options={})
      options.merge! @auth
      response = self.class.get(endpoint,options).parsed_response
      if response["status"] == "ERROR"
        raise AuthError
      else
        return response
      end
    end
  end
end
