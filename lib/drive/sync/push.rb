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
          
          data = {
            "files" => [
               "id"=> "efe59460-dc6c-4d85-8b49-561374a48ad9",
                "name"=> "Code",
                "type"=> "server_js",
                "source"=> "/* oh hai this is blubb */" #this needs to be valid Javascript!!!
            ]
          }

          result = gdrive.client.execute(
                :http_method => :PUT,
                :headers => { "Content-Type" => "application/vnd.google-apps.script+json"},
                :content_type =>  'application/vnd.google-apps.script+json',
                :uri => 'https://www.googleapis.com/upload/drive/v2/files/11RSpoFJJ_cJzlQMhFlZf7JKzh_Qf3_g1K-nIzysRkQ34-rbITXd6a8Gg',
                :body_object  => data)
        end
      end
    end
  end
end