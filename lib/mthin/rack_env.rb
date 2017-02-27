class RackEnv
  attr_reader :REQUEST_METHOD, :PATH_INFO

  def initialize(http_request)
    parse(http_request)
  end

  def [](key)
    self.send(key)
  end

  private

  def parse(http_request)
    @REQUEST_METHOD = http_request.split(" ")[0]
    @PATH_INFO = http_request.split(" ")[1]
  end
end
