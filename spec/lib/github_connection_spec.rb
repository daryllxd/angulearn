require_relative '../../lib/github_connection'

describe GithubConnection do

  it 'connects to the Github API' do
    connection = GithubConnection.new
    expect(connection).not_to be nil
  end

end
