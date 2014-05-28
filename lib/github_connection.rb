require 'dotenv'
Dotenv.load
require 'octokit'

class GithubConnection
  attr_reader :user, :connection, :client_id, :client_secret, :callback_url

  GITHUB_ENDPOINT_URL = 'https://github.com'

  def initialize
    @client_id = ENV['GITHUB_CLIENT_ID']
    @client_secret = ENV['GITHUB_CLIENT_SECRET']
    @callback_url = "http://localhost:3000/callback"
  end

  def connection
    @connection ||= Faraday.new(url: GITHUB_ENDPOINT_URL, ssl: {verify: false}) do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter Faraday.default_adapter
    end
  end

  def github_oauth_url
    base_url = 'https://github.com/login/oauth/authorize/?'
    request_credentials = {
      client_id: client_id,
      redirect_url: callback_url,
      scope: 'user,repo',
      state: Time.now.to_i
    }.to_param

    GITHUB_OAUTH_BASE_URL + request_credentials
  end

  def generate_api_token(code)
    data = {
      client_id: client_id,
      client_secret: client_secret,
      redirect_uri: callback_url,
      code: code
    }

    response = connection.post do |request|
      request.url '/login/oauth/access_token'
      request.params = data
    end

    if response.status.eql?(200)
      Rack::Utils.parse_nested_query(response.body)
    else
      { error: response.status }
    end
  end

  def authorize_url
    request_url = URI::HTTPS.build({
      host: 'github.com',
      path: '/login/oauth/authorize',
      query: {
        client_id: client_id,
        redirect_uri: callback_url,
        scope: 'user,repo,repo:status,notifications',
        state: Time.now.to_i
      }.to_param
    }).to_s.gsub('.plus.', '+').html_safe

    return request_url
  end
end
