
require "json"

module Cog
  class Response
    include Cog::Logger

    attr_accessor :template, :body

    def initialize(template: nil, body: nil)
      @template = template
      @body = body
    end

    def write
      return if body.nil?

      puts "COG_TEMPLATE: #{template}" unless template.nil?

      if body.is_a?(String)
        puts body
      else
        puts "JSON\n"
        puts body.to_json
      end

      STDOUT.flush
    end
  end
end
