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

# $stdout.write  "Enter authorization code: "
# client.authorization.code = gets.chomp
# client.authorization.fetch_access_token!

client.authorization.access_token="ya29.1.AADtN_Vjpn_AXujBVdmpimVEvoEfFCn6UCG-HAmpV93Lr9vabf5DxQtlGqF1p2E"
puts client.authorization.access_token
Google::APIClient.logger.level=Logger::DEBUG

data = {
  "files" => [
     "id"=> "efe59460-dc6c-4d85-8b49-561374a48ad9",
      "name"=> "Code",
      "type"=> "server_js",
      "source"=> "/* oh hai this is test */" #this needs to be valid Javascript!!!
  ]
}

result = client.execute(
      :http_method => :PUT,
      :headers => { "Content-Type" => "application/vnd.google-apps.script+json"},
      :content_type =>  'application/vnd.google-apps.script+json',
      :uri => 'https://www.googleapis.com/upload/drive/v2/files/11RSpoFJJ_cJzlQMhFlZf7JKzh_Qf3_g1K-nIzysRkQ34-rbITXd6a8Gg',
      :body_object  => data)

puts result.data