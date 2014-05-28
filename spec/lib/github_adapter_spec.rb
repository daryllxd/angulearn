require_relative '../../lib/github_adapter'

describe GithubAdapter do
  let(:github_adapter) { GithubAdapter.new(ENV['GITHUB_ACCESS_TOKEN']) }

  it '#individual_repositories' do
    expect(github_adapter.individual_repositories.count).to eq 23
  end

  it '#organization_repositories' do
    expect(github_adapter.organization_repositories.count).to eq 25
  end

end

