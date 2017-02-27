require 'guard/plugin'

module ::Guard
  class Cinatra < Plugin
    def initialize(options = {})
      super(options)
    end

    def start
      @pid = Process.spawn("ruby lib/app.rb")
    end

    def stop
      Process.kill("KILL", @pid)
      Process.wait(@pid)
      @pid = nil
      true
    end

    def restart
      stop
      start
    end

    def run_on_modifications(paths)
      restart
    end
  end
end

guard :cinatra do
  watch(//)
end
