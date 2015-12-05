require "thor"

module Hajimeru
  module Generator
    class GroongaPlugin < Thor::Group
      include Thor::Actions

      argument :name

      def self.source_root
        File.join(File.dirname(__FILE__), "templates", "groonga_plugin")
      end

      def create_files
        git_user_name = `git config user.name`.chomp
        git_user_email = `git config user.email`.chomp
        config = {
          plugin_name: name,
          author: (git_user_name || "TODO: YOUR NAME"),
          email: (git_user_email || "TODO: YOUR EMAIL"),
        }
        [
          "Makefile.am.tt",
          "autogen.sh",
          "configure.ac.tt",
          "plugin_name/Makefile.am.tt",
          "plugin_name/plugin_name.c.tt",
          "plugin_name/sources.am.tt",
          "test/Makefile.am",
          "test/run-test.sh",
          "test/suite/register.expected.tt",
          "test/suite/register.test.tt",
        ].each do |path|
          output_path = path.gsub(/plugin_name/, config[:plugin_name])
          output_path = output_path.gsub(/\.tt\z/, "")
          template(path, "#{name}/#{output_path}", config)
          if /\.sh\z/ =~ output_path
            File.chmod(0755, "#{name}/#{output_path}")
          end
        end
      end
    end
  end
end
