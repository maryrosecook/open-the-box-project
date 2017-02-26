require "rack"
require "./routes"

module Minatra
  class Base
    @@server = "thin"
    @@routes = Routes.new

    def self.get(url, &block)
      @@routes.add("GET", url, &block)
    end

    def self.run!
      start_server
    end

    def self.call(env)
      @@routes.route_request(env)
    end

    def self.start_server
      Rack::Handler::WEBrick.run(self)
    end
  end
end
