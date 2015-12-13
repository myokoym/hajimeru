require "thor"
require "securerandom"

module Hajimeru
  module Generator
    class Xul < Thor::Group
      include Thor::Actions

      argument :name

      def self.source_root
        File.join(File.dirname(__FILE__), "templates", "xul")
      end

      def create_files
        git_user_name = `git config user.name`.chomp
        git_user_email = `git config user.email`.chomp
        config = {
          author: (git_user_name || "TODO: YOUR NAME"),
          email: (git_user_email || "TODO: YOUR EMAIL"),
          uuid: SecureRandom.uuid,
        }
        [
          ".gitignore",
          #".gitmodules",
          "LICENSE",
          "Makefile.tt",
          "README.md.tt",
          "chrome.manifest.tt",
          "content/overlay.xul.tt",
          "locale/en-US/messages.dtd",
          "locale/en-US/messages.properties",
          "locale/ja/messages.dtd",
          "locale/ja/messages.properties",
          "install.rdf.tt",
        ].each do |path|
          output_path = path.gsub(/\.tt\z/, "")
          template(path, File.join(name, output_path), config)
        end
        Dir.chdir(name) do
          system("git", "init")
          system("git", "submodule", "add", "https://github.com/piroor/makexpi")
        end
      end
    end
  end
end
