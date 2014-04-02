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
          
          result = gdrive.client.execute(
            :api_method => gdrive.drive.files.get,
            :parameters => {
              'fileId' => '11RSpoFJJ_cJzlQMhFlZf7JKzh_Qf3_g1K-nIzysRkQ34-rbITXd6a8Gg'
            })

          project_hash = gdrive.client.execute(:uri => result.data.export_links["application/vnd.google-apps.script+json"]).data

          project = ScriptProject.new(project_hash)

          project.files.each do |file| 
            File.open(file.filename,'w') { |out| out.write(file.source) }
          end
        end
      end
    end
  end
end