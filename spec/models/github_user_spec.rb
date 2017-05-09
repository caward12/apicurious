require 'rails_helper'

describe 'GithubUser' do
  context '#find_photo' do
    it "can find photo for single user" do
      skip
      token = ENV['GITHUB_USER_TOKEN']
      user = GithubUser.search_user(token)
      expect(user.avatar_url).to eq("https://avatars3.githubusercontent.com/u/20826865?v=3")
    end
  end
end