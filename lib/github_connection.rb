require 'dotenv'
Dotenv.load
require 'octokit'

class GithubConnection
  attr_reader :user

  def initialize(access_token = ENV['GITHUB_ACCESS_TOKEN'])
    @user = Octokit::Client.new(access_token: access_token).user
  end

end
