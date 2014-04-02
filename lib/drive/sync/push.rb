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
          project = gdrive.get_project_with_id('11RSpoFJJ_cJzlQMhFlZf7JKzh_Qf3_g1K-nIzysRkQ34-rbITXd6a8Gg')

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
                :uri => 'https://www.googleapis.com/upload/drive/v2/files/11RSpoFJJ_cJzlQMhFlZf7JKzh_Qf3_g1K-nIzysRkQ34-rbITXd6a8Gg',
                :body_object  => new_project.to_hash)
        end
      end
    end
  end
end