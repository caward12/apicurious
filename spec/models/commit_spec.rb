require 'rails_helper'

describe "commit" do
  context "create commits" do
    it "can create recent commits from raw data" do
      VCR.use_cassette("commits") do
        token = ENV['GITHUB_USER_TOKEN']
        user = GithubUser.search_user(token)
        nickname = 'caward12'
        commits = user.recent_commits(nickname)

        expect(commits).to be_an(Array)
        expect(commits.first).to be_a(Commit)
        expect(commits.count).to eq(5)
      end
    end
  end

end