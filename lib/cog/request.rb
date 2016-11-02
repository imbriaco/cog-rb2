module Cog
  class Request
    attr_accessor :options, :args, :input

    def initialize(env = ENV, input = default_input)
      @args = populate_args(env)
      @options = populate_options(env)
      @input = parse_input(input)
    end

    private

    def default_input
      STDIN.tty? ? "{}" : STDIN.read
    end

    def populate_args(env)
      (0 .. (env['COG_ARGC'].to_i - 1)).map { |n| env["COG_ARGV_#{n}"] }
    end

    def populate_options(env)
      return {} if env['COG_OPTS'].nil?
      options = env["COG_OPTS"].split(",")
      Hash[options.map { |opt| [ opt, opt_val(opt) ] }]
    end

    # Returns the value of option env var specified by 'opt'. If option is
    # a list it will include a count. In that case we return an array of values.
    def opt_val(opt)
      count = env["COG_OPT_#{opt.upcase}_COUNT"]
      if count
        count.to_i.times.map { |i| env["COG_OPT_#{opt.upcase}_#{i}"] }
      else
        env["COG_OPT_#{opt.upcase}"]
      end
    end

    def parse_input(input)
      return input if [ Hash, Array ].include?(input.class)
      JSON.parse(input, create_additions: false)
    end
  end
end
