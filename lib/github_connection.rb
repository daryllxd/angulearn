require 'dotenv'
Dotenv.load
require 'octokit'

class GithubConnection
  attr_reader :client

  def initialize(login = ENV['GITHUB_USERNAME'], password = ENV['GITHUB_PASSWORD'])
    @client = Octokit::Client.new(:login => login, :password => password)
  end

end
