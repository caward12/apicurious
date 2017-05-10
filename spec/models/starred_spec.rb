require 'rails_helper'

describe 'Starred' do
  context 'starred' do
    it "can create  for single user" do
      VCR.use_cassette("github_user") do
        token = ENV['GITHUB_USER_TOKEN']
        user = GithubUser.search_user(token)
        expect(user.avatar_url).to eq("https://avatars3.githubusercontent.com/u/20826865?v=3")
      end
    end
  end