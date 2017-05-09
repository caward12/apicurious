require 'rails_helper'

describe GithubService do
  context ".search(token)" do
    it "finds one raw user" do

      nickname = "caward12"
      user = GithubService.new.search_user(nickname)

      expect(user).to be_a(Hash)
      expect(user).to have_key(:avatar_url)
      expect(user[:avatar_url]).to be_a(String)
    end
  end
end