module Cog
  class Command
    attr_accessor :request

    def initialize(request)
      puts "Initializing #{self.inspect} with #{request.inspect}."
    end

    def run_command
      render("foo")
    end

    def render(content = {})
      content = { body: content } if content.is_a? String
      response = Cog::Response.new(content)
      puts "Sending Response: #{response.inspect}"
      response
    end
  end
end
