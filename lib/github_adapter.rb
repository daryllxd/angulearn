require_relative 'github_connection'

class GithubAdapter
  attr_reader :connection, :faraday

  def initialize
    @connection = GithubConnection.new
  end

  def individual_repositories
    user_info = @connection.user
    projects  = user_info.rels[:repos].get.data
    projects.map{|hash| {id: hash.id, name: hash.full_name, client: "github"}}
  end

  def organization_repositories
    # organizations = user_info.rels[:organizations].get.data
    # organizations.each do |org|
    #   projects += find_projects_by_organization(org)
    # end
  end

  def get_avatar(user)
    if user
      image_url = Gravatar.new(user.email).image_url + "?s=512&d=identicon"
      if user.avatars.where(client: 'github').present?
        avatar = user.avatars.where(client: 'github').first
      else
        default = user.avatars.where(default: true).present? ? false : true
        avatar = user.avatars.build(default: default, client: 'github')
      end
      avatar.image_from_url(image_url)
    end
  end


end
