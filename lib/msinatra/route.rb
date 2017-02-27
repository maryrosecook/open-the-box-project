module Msinatra
  class Route
    attr_reader :block

    def initialize(method, url, &block)
      @method = method
      @url = url
      @block = block
    end

    def matches?(method, path)
      method == method && path == path
    end

    private

    attr_reader :method, :path
  end
end
