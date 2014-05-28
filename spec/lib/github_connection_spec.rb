require_relative '../../lib/github_connection'

describe GithubConnection do

  it 'connects to the right keys' do
    connection = GithubConnection.new
    expect(connection.client_id).to eq ENV['GITHUB_CLIENT_ID']
    expect(connection.client_secret).to eq ENV['GITHUB_CLIENT_SECRET']
  end

  # extract to own class
  describe '.connection' do
    it 'is a Faraday connection' do
      github_connection = GithubConnection.new.connection
      expect(github_connection).to be_a Faraday::Connection
    end

    it 'doesn\'t create a new Faraday connection' do
      github_connection = GithubConnection.new
      first_connection = github_connection.connection
      second_connection = github_connection.connection

      expect(first_connection.object_id).to eq second_connection.object_id
    end
  end

  describe '.request_github_access' do
    it 'pogi' do
      github_connection = GithubConnection.new
      expect(github_connection.request_github_access).to eq 'dqdqwwqqwd'

    end
  end

  # get api token
  describe '.generate_api_token' do
    it 'gets a token' do
      github_connection = GithubConnection.new
      token = github_connection.generate_api_token("pogi")
      expect(token).to eq 'pogi'
    end

  end

end
