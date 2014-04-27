require_relative '../../lib/github_adapter'

describe GithubAdapter do

  it '.repositories' do
    adapter = GithubAdapter.new
    expect(GithubAdapter.new.individual_repositories.count).to eq 23
  end

  it 'has an avatar' do
    adapter = GithubAdapter.new
    adapter.get_avatar(user).should eq "what?"

  end


end

