require_relative "../../mthin/server"

module Mrack
  module Handler
    class Mthin
      HOST = "localhost"
      PORT = 8080

      def self.run(app)
        create_server(app).start
      end

      private

      def self.create_server(app)
        ::Mthin::Server.new(HOST, PORT, app)
      end
    end
  end
end
