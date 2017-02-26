require "rack"
require "./routes"

module Minatra
  class Base
    @@routes = Routes.new

    def self.get(url, &block)
      @@routes.add("GET", url, &block)
    end

    def self.run!
      start_server
    end

    def self.call(rack_env)
      @@routes.route_request(rack_env)
    end

    def self.start_server
      Rack::Handler::WEBrick.run(self)
    end
  end
end
