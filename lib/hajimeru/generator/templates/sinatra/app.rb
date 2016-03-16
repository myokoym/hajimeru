require "sinatra/base"
require "sinatra/reloader"

# temporary solution against Encoding::InvalidByteSequenceError for passenger
Encoding.default_external = "UTF-8"

class App < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  configure do
    set :assets_precompile, %w(application.js)
    set :assets_js_compressor, :uglifier
    register Sinatra::AssetPipeline

    # Actual Rails Assets integration, everything else is Sprockets
    if defined?(RailsAssets)
      RailsAssets.load_paths.each do |path|
        settings.sprockets.append_path(path)
      end
    end
  end

  get "/" do
    haml :index
  end
end
