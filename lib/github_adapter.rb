require_relative 'github_connection'

class GithubAdapter
  attr_reader :connection, :faraday, :token

  def initialize(token)
    @token = token
    @connection = GithubConnection.new
  end

  def individual_repositories
    projects  = user.rels[:repos].get.data
    projects.map{|hash| {id: hash.id, name: hash.full_name, client: "github"}}
  end

  def organization_repositories
    organizations = user.rels[:organizations].get.data
    binding.pry
    organizations.each do |org|
      projects += find_projects_by_organization(org)
    end
    organizations
  end

    def blocks(token)
      user_info = Octokit::Client.new(access_token: token).user
      projects  = user_info.rels[:repos].get.data
      organizations = user_info.rels[:organizations].get.data
      organizations.each do |org|
        projects += find_projects_by_organization(org)
      end
      @blocks = projects.map{|hash| {id: hash.id, name: hash.full_name, client: "github"}}
    end


  def user
    Octokit::Client.new(access_token: token).user
  end

end
