module Theparty

  class Client
    include HTTParty

    base_uri "https://www.linkedin.com"

    def initialize
    end

    def posts(code)
        options = {
          grant_type: "authorization_code",
          client_id: ENV['CLIENT_ID'],
          redirect_uri: "http://localhost:9393/logged_in",
          client_secret: ENV['CLIENT_SECRET'],
          code: code
          }
        options
    end
  end
end