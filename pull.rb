require 'rubygems'
require 'google/api_client'
require 'launchy'
require 'net/http'

# Get your credentials from the console
CLIENT_ID = '1044808035117-1e260pacvpkkluic9ef97s19hrs2bakr.apps.googleusercontent.com'
CLIENT_SECRET = 'eMFOhG6T0_ilzdIWXX8VddNB'
OAUTH_SCOPE = ['https://www.googleapis.com/auth/drive','https://www.googleapis.com/auth/drive.scripts']
REDIRECT_URI = 'urn:ietf:wg:oauth:2.0:oob'

# Create a new API client & load the Google Drive API
client = Google::APIClient.new
drive = client.discovered_api('drive', 'v2')

# Request authorization
client.authorization.client_id = CLIENT_ID
client.authorization.client_secret = CLIENT_SECRET
client.authorization.scope = OAUTH_SCOPE
client.authorization.redirect_uri = REDIRECT_URI

# uri = client.authorization.authorization_uri
# Launchy.open(uri)

# # Exchange authorization code for access token
# $stdout.write  "Enter authorization code: "
# client.authorization.code = gets.chomp
# client.authorization.fetch_access_token!
client.authorization.access_token="ya29.1.AADtN_WJbQCfMRpVIpJwSnK3NPCXz3zI8Y3066MVKl3-vPXdr9GXxDnPv5XfDukfoGQG4Q"


result = client.execute(
  :api_method => drive.files.get,
  :parameters => {
    'fileId' => '11RSpoFJJ_cJzlQMhFlZf7JKzh_Qf3_g1K-nIzysRkQ34-rbITXd6a8Gg'
  })


project = client.execute(:uri => result.data.export_links["application/vnd.google-apps.script+json"]).data

project["files"].each do |file| 
  file_name = "#{file['name']}.#{file['type']}"
  file_source = file['source']
  File.open(file_name,'w') { |out| out.write(file_source) }
end