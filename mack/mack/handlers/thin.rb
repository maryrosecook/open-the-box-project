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
        ::Thin::Server.new(host, port, app)
      end
    end
  end
end
