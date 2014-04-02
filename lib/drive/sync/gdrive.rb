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

        uri = client.authorization.authorization_uri
        Launchy.open(uri)

        $stdout.write  "Enter authorization code: "
        client.authorization.code = gets.chomp
        client.authorization.fetch_access_token!
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
    end
  end
end