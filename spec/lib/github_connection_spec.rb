require_relative '../../lib/github_connection'

describe GithubConnection do

  it 'connects to the Github API' do
    connection = GithubConnection.new
    expect(connection.user.name).to eq 'Daryll Santos'
  end

  describe '.connection' do
    it 'is a Faraday connection' do
      github_connection = GithubConnection.new.connection
      expect(github_connection).to be_a Faraday::Connection
    end

    it 'caches the Faraday connection' do
      github_connection = GithubConnection.new
      first_connection = github_connection.connection
      second_connection = github_connection.connection

      expect(first_connection.object_id).to eq second_connection.object_id
    end
  end

end
