require "./thin_runner"
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

    private

    def self.start_server
      Mack::ThinRunner.run(self)
    end
  end
end
