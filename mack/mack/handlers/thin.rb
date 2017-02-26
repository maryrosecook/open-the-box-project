require "thin"

module Mack
  module Handler
    class Thin
      def self.run(app)
        create_server(app).start
      end

      private

      def self.create_server(app)
        host = "localhost"
        port = 8080
        args = [host, port, app]
        ::Thin::Server.new(*args)
      end
    end
  end
end
