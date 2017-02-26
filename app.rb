require "./minatra"

class App < Minatra::Base
  get '/' do
    "hello, world!"
  end

  run!
end
