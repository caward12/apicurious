require 'rails_helper'

describe GithubService do
  context "search_user(nickname)" do
    it "finds one raw user" do

      nickname = "caward12"
      token = ENV['GITHUB_USER_TOKEN']
      user = GithubService.new(token).search_user(nickname)

      expect(user).to be_a(Hash)
      expect(user).to have_key(:avatar_url)
      expect(user[:avatar_url]).to be_a(String)
    end
  end

  context "starred(nickname)" do
    it "finds user's starred repos" do
    
      token = ENV['GITHUB_USER_TOKEN']
      nickname = "caward12"
      starred = GithubService.new(token).starred(nickname)

      expect(starred).to be_an(Array)
      expect(starred.count).to eq(1)
    end
  end

  context "followers(nickname)" do
    it "finds user's followers" do
      token = ENV['GITHUB_USER_TOKEN']
      nickname = "caward12"
      followers = GithubService.new(token).followers(nickname)

      expect(followers).to be_an(Array)
      expect(followers.first).to be_a(Hash)
      expect(followers.count).to eq(3)
    end
  end
end