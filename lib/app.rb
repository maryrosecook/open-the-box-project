require_relative "./msinatra/msinatra"

class App < Msinatra::Base
  get '/' do
    "hello, world! yes!"
  end

  run!
end
