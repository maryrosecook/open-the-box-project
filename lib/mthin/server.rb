require "socket"
require_relative "./rack_env"
require_relative "./http_response"

module Mthin
  class Server
    def initialize(host, port, app)
      @app = app
      @tcp_server = create_tcp_server(host, port)
    end

    def start
      enter_server_request_listen_loop
    end

    private

    def create_tcp_server(host, port)
      TCPServer.new(host, port)
    end

    def enter_server_request_listen_loop
      loop do
        handle_request
      end
    end

    def handle_request
      socket = @tcp_server.accept
      socket.print(http_response(rack_response(socket.gets)))
      socket.close
    end

    def rack_response(http_request)
      @app.call(RackEnv.new(http_request))
    end

    def http_response(rack_response)
      HttpResponse.new(rack_response)
    end
  end
end
