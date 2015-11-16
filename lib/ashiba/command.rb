require "thor"
require "ashiba/generator"
require "ashiba/version"

module Ashiba
  class Command < Thor
    register(Generator::JavaScript, "javascript", "javascript PROJECT_NAME", "Scaffold the JavaScript project")
    register(Generator::Sinatra, "sinatra", "sinatra PROJECT_NAME", "Scaffold the Sinatra project")

    desc "version", "Show version"
    def version
      puts(VERSION)
    end
  end
end
