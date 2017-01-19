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
        command.response.write unless command.response.nil?
      else
        abort("No route found for command #{command_name}.")
      end
    end

    def self.route_for(name, action)
      case action
      when nil
        { :class => class_for(name.gsub("-", "_").camelize),
          :method => :run_command }
      else
        class_name, method = action.split("#")
        { :class => class_for(class_name),
          :method => method&.to_sym || :run_command }
      end
    end

    private

    def self.class_for(name)
      klass = Object.const_get(name)

      if klass.ancestors.include?(Cog::Command)
        klass
      else
        raise(RuntimeError, "Error: #{name} must be a subclass of Cog::Command")
      end
    end
  end
end
