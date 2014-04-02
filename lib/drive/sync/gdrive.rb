module Drive
  module Sync
    class GDrive
      CLIENT_ID = '1044808035117-1e260pacvpkkluic9ef97s19hrs2bakr.apps.googleusercontent.com'
      CLIENT_SECRET = 'eMFOhG6T0_ilzdIWXX8VddNB'
      OAUTH_SCOPE = ['https://www.googleapis.com/auth/drive','https://www.googleapis.com/auth/drive.scripts']
      REDIRECT_URI = 'urn:ietf:wg:oauth:2.0:oob'
      def self.connect 
        client = Google::APIClient.new
        drive = client.discovered_api('drive', 'v2')

        client.authorization.client_id = CLIENT_ID
        client.authorization.client_secret = CLIENT_SECRET
        client.authorization.scope = OAUTH_SCOPE
        client.authorization.redirect_uri = REDIRECT_URI

        if (Drive::Sync::Settings.config['access_token'] == nil)
          uri = client.authorization.authorization_uri
          Launchy.open(uri)

          $stdout.write  "Enter authorization code: "
          client.authorization.code = gets.chomp
          client.authorization.fetch_access_token!
        else 
          client.authorization.access_token = Drive::Sync::Settings.config['access_token']          
          client.authorization.refresh_token = Drive::Sync::Settings.config['refresh_token']          

          client.authorization.refresh! if client.authorization.expired?

        end

        Drive::Sync::Settings.config['access_token'] = client.authorization.access_token
        Drive::Sync::Settings.config['refresh_token'] = client.authorization.refresh_token

        GDrive.new(client,drive)
      end

      def initialize(client,drive)
        @client = client
        @drive = drive
      end

      def client 
        @client
      end 

      def drive
        @drive
      end

      def get_project_with_id(id)
        result = @client.execute(
          :api_method => @drive.files.get,
          :parameters => {
            'fileId' => id
          })

        project_hash = @client.execute(:uri => result.data.export_links["application/vnd.google-apps.script+json"]).data

        ScriptProject.from_hash(project_hash)
      end
    end
  end
end
