module Cog
  class Router
    @routes = []

    def initialize(routes)
      @routes = routes
    end

    def dispatch(request, env: ENV)
      command_name = env['COG_COMMAND'] || abort("No command specified in $COG_COMMAND.")

      if route = @routes[command_name]
        command = route[:class].new(request)
        command.send(route[:method])
      else
        abort("No route found for command #{command_name}.")
      end
    end

    def self.route_for(name, action)
      if action.nil?
        {
          :class => Object.const_get(name.gsub("-", "_").camelize),
          :method => :run_command
        }
      else
        klass, method = action.split("#")
        {
          :class => Object.const_get(klass),
          :method => method&.to_sym || :run_command
        }
      end
    end
  end
end
