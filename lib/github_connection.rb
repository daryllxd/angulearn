require 'dotenv'
Dotenv.load
require 'octokit'

class GithubConnection
  attr_reader :user, :connection

  GITHUB_ENDPOINT = 'https://github.com'

  def initialize(access_token = ENV['GITHUB_ACCESS_TOKEN'])
    @user = Octokit::Client.new(access_token: access_token).user
  end


  def connection
    @connection ||= Faraday.new(:url => GITHUB_ENDPOINT, ssl: {verify: false}) do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter Faraday.default_adapter
    end
  end

end
