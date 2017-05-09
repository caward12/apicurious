require 'rails_helper'

describe 'GithubUser' do
  context '#find_photo' do
    it "can find photo for single user" do
      skip
      nickname = "caward12"
      user = GithubUser.search_user(nickname)
      expect(user.avatar_url).to eq("https://avatars3.githubusercontent.com/u/20826865?v=3")
    end
  end
end