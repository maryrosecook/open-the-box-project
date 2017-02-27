require_relative "./route"

module Msinatra
  class Routes
    def initialize
      @routes = []
    end

    def add(verb, url, &block)
      @routes << Route.new(verb, url, &block)
    end

    def route_request(rack_env)
      route = @routes.find do |route|
        route.matches?(rack_env["REQUEST_METHOD"],
                       rack_env["PATH_INFO"])
      end

      ["200", {}, [route.block.call]]
    end
  end
end
