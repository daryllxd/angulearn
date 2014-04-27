require_relative '../../lib/github_connection'

describe GithubConnection do

  it 'connects to the Github API' do
    connection = GithubConnection.new
    expect(connection.user.name).to eq 'Daryll Santos'
  end

end
