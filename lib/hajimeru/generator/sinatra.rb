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
        git_user_name = `git config user.name`.chomp
        git_user_email = `git config user.email`.chomp
        config = {
          author: (git_user_name || "TODO: YOUR NAME"),
          email: (git_user_email || "TODO: YOUR EMAIL"),
        }
        [
          "views/layout.haml",
          "LICENSE.txt",
          "README.md",
        ].each do |path|
          template("#{path}.tt", "#{name}/#{path}", config)
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
