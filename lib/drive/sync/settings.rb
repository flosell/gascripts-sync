require "yaml"
module Drive
  module Sync
    module Settings
      extend self

      @_settings = {}
      
      def load!()
        File.open(".script-project","w") {} if (!File.exists?(".script-project")) #dirty hack to create new file if necessary
        @_settings = YAML::load_file(".script-project") || {}
      end

      def save!()
        File.open(".script-project", 'w') {|f| f.write(@_settings.to_yaml) }
      end

      def config 
        @_settings
      end
    end
  end
end