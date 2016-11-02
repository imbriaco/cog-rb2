# Experimental Cog Ruby SDK

Example cog-command:

```
#!/usr/bin/env ruby

# Add the lib directory to the load path
libdir = File.join(File.dirname(__FILE__), "lib")
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require "bundler/setup"
require "cog"
require "wisp"

Cog.configure do
  command "template-list"
  command "template-deploy", action: "Wisp::Template#deploy"
end.run
```
