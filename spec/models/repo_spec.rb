require 'rails_helper'

describe "repo" do
  context "create repos" do
    it "can create repos from raw data" do
      VCR.use_cassette("repos") do
        token = ENV['GITHUB_USER_TOKEN']
        user = GithubUser.search_user(token)
        repos = user.repos(token)

        expect(repos).to be_an(Array)
        expect(repos.first).to be_a(Repo)
        expect(repos.count).to eq(30)
      end
    end
  end

end