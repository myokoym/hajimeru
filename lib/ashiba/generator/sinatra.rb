require "thor"

module Ashiba
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
          "views/index.haml",
          "app.rb",
          "config.ru",
          "Gemfile",
        ].each do |path|
          copy_file(path, "#{name}/#{path}")
        end
      end
    end
  end
end
