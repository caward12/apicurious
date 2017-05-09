require 'rails_helper'

describe GithubService do
  context ".search(token)" do
    it "finds one raw user" do
      token = ENV['GITHUB_USER_TOKEN']
      user = GithubService.search_user(token)

      expect(user).to be_a(Hash)
      byebug
      expect(user).to have_key(:avatar_url)
      expect(user[:avatar_url]).to be_a(String)
    end
  end
end