require_relative "../mrack/handlers/mthin"
require_relative "./routes"

module Msinatra
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
      Mrack::Handler::Mthin.run(self)
    end
  end
end
