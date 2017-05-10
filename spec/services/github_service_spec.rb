require 'rails_helper'

describe GithubService do
  context ".search(nickname)" do
    it "finds one raw user" do
      nickname = "caward12"
      token = ENV['GITHUB_USER_TOKEN']
      user = GithubService.new(token).search_user(nickname)

      expect(user).to be_a(Hash)
      expect(user).to have_key(:avatar_url)
      expect(user[:avatar_url]).to be_a(String)
    end

    it "finds user's starred repos" do
      token = ENV['GITHUB_USER_TOKEN']
      nickname = "caward12"
      starred = GithubService.new(token).starred(nickname)

      expect(starred).to be_an(Array)
      expect(starred.count).to eq(1)
    end
  end
end