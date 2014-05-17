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
      class PushCommand
        def run
          gdrive = GDrive.connect
          project = gdrive.get_project_with_id(Drive::Sync::Settings.config["project_id"])

          files = Dir["*.server_js"].map do |filename|
            id = project.id_from_name(filename)
            name = filename.gsub(/.server_js/, "")
            type = "server_js"
            source = File.read(filename)

            puts "Pushing #{filename}"

            ProjectFile.new(id,name,type,source)
          end

          new_project = ScriptProject.new(files)

          result = gdrive.client.execute(
                :http_method => :PUT,
                :headers => { "Content-Type" => "application/vnd.google-apps.script+json"},
                :content_type =>  'application/vnd.google-apps.script+json',
                :uri => 'https://www.googleapis.com/upload/drive/v2/files/'+Drive::Sync::Settings.config["project_id"],
                :body_object  => new_project.to_hash)
          if (result.status != 200) 
            error_message = result.data["error"]["errors"][0]["message"]
            puts "ERROR: Google replied with #{error_message}. Do you have syntax errors in your code?"
          else 
            puts "Push successful"
          end
        end
      end
    end
  end
end