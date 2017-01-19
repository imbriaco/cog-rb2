module Cog
  class Command
    include Cog::Logger

    attr_accessor :request, :response

    def initialize(request)
      debug("Initializing #{self.inspect} with #{request.inspect}.")
      @request = request
    end

    def render(template: nil, body: nil)
      @response = Cog::Response.new(template: template, body: body)
    end

    def log(level = :info, message)
      Cog.log(level, message)
    end
  end
end
