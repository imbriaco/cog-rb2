module Cog
  class Response
    attr_accessor :content

    def initialize(content = {})
      @content = content
    end
  end
end
