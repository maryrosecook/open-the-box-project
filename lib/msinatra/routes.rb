require_relative "./route"

module Msinatra
  class Routes
    def initialize
      @routes = []
    end

    def add(verb, url, &block)
      @routes << Route.new(verb, url, &block)
    end

    def matching_route(rack_env)
      @routes.find do |route|
        route.matches?(rack_env["REQUEST_METHOD"],
                       rack_env["PATH_INFO"])
      end
    end

    def route_request(rack_env)
      body = matching_route(rack_env).block.call
      ["200", {}, [body]]
    end
  end
end
