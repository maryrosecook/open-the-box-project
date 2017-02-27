class HttpResponse
  def initialize(rack_response)
    @method = rack_response[0]
    @body = rack_response[2].join("")
  end

  def to_s
    [headers,
     empty_line,
     body].join("")
  end

  private

  attr_reader :method, :body

  def empty_line
    "\r\n"
  end

  def headers
    ["HTTP/1.1 #{method} OK\r\n",
     "Content-Type: text/plain\r\n",
     "Content-Length: #{byte_size}\r\n",
     "Connection: close\r\n"].join("")
  end

  def byte_size
    @body.bytesize
  end
end
