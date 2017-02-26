require "thin"

module Mack
  module Handler
    class Thin
      HOST = "localhost"
      PORT = 8080

      def self.run(app)
        create_server(app).start
      end

      private

      def self.create_server(app)
        ::Thin::Server.new(HOST, PORT, app)
      end
    end
  end
end
