module VoipApi
  # The custom rails generator
  module Generators
    # Generates the default configuration file for customizing the VoipApi gem.
    class ConfigGenerator < Rails::Generators::Base
      source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))

      desc <<DESC
Description:
    Copies VoipApi's configuration file to your application's initializer directory.
DESC

      # Copies the template file over.
      def copy_config_file
        template 'voip_api_config.rb', 'config/initializers/voip_api.rb'
      end
    end
  end
end
