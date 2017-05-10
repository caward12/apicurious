require 'rails_helper'

describe 'GithubUser' do
  context 'avatar_url' do
    it "can find photo for single user" do
      nickname = "caward12"
      token = ENV['GITHUB_USER_TOKEN']
      user = GithubUser.search_user(token, nickname)
      expect(user.avatar_url).to eq("https://avatars3.githubusercontent.com/u/20826865?v=3")
    end
  end

  context 'starred' do
    it "can find starred repos" do
      nickname = "caward12"
      token = ENV['GITHUB_USER_TOKEN']
      user = GithubUser.search_user(token, nickname)
      starred = user.starred(token, user.nickname)

      expect(starred).to be_an(Array)
      expect(starred.count).to eq(1)
    end
  end
end