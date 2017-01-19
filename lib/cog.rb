
require "json"

require "active_support/core_ext/string/inflections"

require_relative "cog/logger"
require_relative "cog/dsl"
require_relative "cog/router"

require_relative "cog/command"
require_relative "cog/request"
require_relative "cog/response"
require_relative "cog/version"

module Cog
  @debug = false
  @base = nil
  @routes = {}

  def self.run
    router = Cog::Router.new(@routes)
    request = Cog::Request.new
    router.dispatch(request)
  end

  def self.configure(&block)
    dsl = Cog::DSL.new
    dsl.instance_eval(&block)
    self
  end

  def self.routes
    @routes
  end

  def self.base
    @base
  end

  def self.log(level = :info, message)
    puts "COGCMD_#{level.to_s.upcase}: #{message}"
  end
end
