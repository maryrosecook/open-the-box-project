require "./route"

module Minatra
  class Routes
    def initialize
      @routes = []
    end

    def add(verb, url, &block)
      @routes << Route.new(verb, url, &block)
    end

    def route_request(request)
      route = @routes.find do |route|
        route.matches?(request["REQUEST_METHOD"],
                       request["PATH_INFO"])
      end

      ["200", {}, [route.block.call]]
    end
  end
end
