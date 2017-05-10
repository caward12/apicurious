require 'rails_helper'

describe 'GithubUser' do
  context 'avatar_url' do
    it "can find photo for single user" do
      skip
      nickname = "caward12"
      token = ENV['GITHUB_USER_TOKEN']
      user = GithubUser.search_user(token, nickname)
      expect(user.avatar_url).to eq("https://avatars3.githubusercontent.com/u/20826865?v=3")
    end
  end

  context 'starred' do
    it "can find starred repos" do
      skip
      nickname = "caward12"
      token = ENV['GITHUB_USER_TOKEN']
      user = GithubUser.search_user(token, nickname)
      starred = user.starred(token, user.nickname)

      expect(starred).to be_an(Array)
      expect(starred.count).to eq(1)
    end
  end

  context 'followers' do
    it "can find followers" do
      nickname = "caward12"
      token = ENV['GITHUB_USER_TOKEN']
      user = GithubUser.search_user(token, nickname)
      followers = user.followers(token, user.nickname)

      expect(followers).to be_an(Array)
      expect(followers.count).to eq(3)
      expect(followers.first).to eq("Carmer")
    end
  end
end