require "thor"
require "launchy"
require "hajimeru/generator"
require "hajimeru/version"

module Hajimeru
  class Command < Thor
    register(Generator::GroongaPlugin, "groonga_plugin", "groonga_plugin PLUGIN_NAME", "Scaffold the Groonga plugin")
    register(Generator::JavaScript, "javascript", "javascript PROJECT_NAME", "Scaffold the JavaScript project")
    register(Generator::Sinatra, "sinatra", "sinatra PROJECT_NAME", "Scaffold the Sinatra project")

    desc "version", "Show version"
    def version
      puts(VERSION)
    end

    desc "reference NAME", "Show reference on your browser"
    def reference(name)
      case name
      when "groonga_plugin"
        Launchy.open("http://groonga.org/docs/reference/api/plugin.html")
      else
        $stderr.puts("#{$0} reference: #{name} is not supported yet. Please search yourself on your browser.")
      end
    end
  end
end
