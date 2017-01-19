module Cog
  module Logger

    LOG_LEVELS = [ :debug, :info, :warn, :err, :error ]

    def debug(message); write_log(:debug, message); end
    def info(message);  write_log(:info, message);  end
    def warn(message);  write_log(:warn, message);  end
    def err(message);   write_log(:error, message); end
    def error(message); write_log(:erro, message);  end

    def write_log(level, message)
      puts "COGCMD_#{level.to_s.upcase}: #{message}"
      STDOUT.flush
    end
  end
end
