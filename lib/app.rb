require_relative "./minatra/minatra"

class App < Minatra::Base
  get '/' do
    "hello, world!"
  end

  run!
end
