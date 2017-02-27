require_relative "../mack/handlers/thin"
require_relative "./routes"

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

    private

    def self.start_server
      Mack::Handler::Thin.run(self)
    end
  end
end
