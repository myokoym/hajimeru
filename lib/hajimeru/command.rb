require "thor"
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
  end
end
