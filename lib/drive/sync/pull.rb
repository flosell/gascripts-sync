require 'rubygems'
require 'google/api_client'
require 'launchy'
require 'net/http'

require "drive/sync/script_project"
require "drive/sync/project_file"
require "drive/sync/gdrive"


module Drive
  module Sync
    module Commands
      class PullCommand
        
        def run
          gdrive = GDrive.connect

          project = gdrive.get_project_with_id(Drive::Sync::Settings.config["project_id"])

          project.files.each do |file| 
            puts "Pulling #{file.filename}"
            File.open(file.filename,'w') { |out| out.write(file.source) }
          end
        end
      end
    end
  end
end