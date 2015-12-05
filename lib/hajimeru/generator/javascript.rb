require "thor"

module Hajimeru
  module Generator
    class JavaScript < Thor::Group
      include Thor::Actions

      argument :name

      def self.source_root
        File.join(File.dirname(__FILE__), "templates", "javascript")
      end

      def create_files
        [
        ].each do |path|
          template("#{path}.tt", "#{name}/#{path}")
        end
      end

      def copy_files
        [
          "index.html",
          "index.js",
        ].each do |path|
          copy_file(path, "#{name}/#{path}")
        end
      end
    end
  end
end
