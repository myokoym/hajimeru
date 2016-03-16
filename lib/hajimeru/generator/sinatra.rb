require "thor"

module Hajimeru
  module Generator
    class Sinatra < Thor::Group
      include Thor::Actions

      argument :name

      def self.source_root
        File.join(File.dirname(__FILE__), "templates", "sinatra")
      end

      def create_files
        [
          "views/layout.haml",
        ].each do |path|
          template("#{path}.tt", "#{name}/#{path}")
        end
      end

      def copy_files
        [
          "assets/js/application.js.es6",
          "views/index.haml",
          "public/.gitkeep",
          "app.rb",
          "config.ru",
          "Gemfile",
          "Rakefile",
        ].each do |path|
          copy_file(path, "#{name}/#{path}")
        end
      end
    end
  end
end
