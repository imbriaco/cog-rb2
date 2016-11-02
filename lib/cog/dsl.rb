module Cog
  class DSL
    def command(name, action: nil)
      Cog.routes[name] = Cog::Router.route_for(name, action)
    end
  end
end
