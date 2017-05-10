require 'rails_helper'

describe GithubService do
  context "search_user" do
    it "finds one raw user" do
      VCR.use_cassette("github_service_search_user") do
        token = ENV['GITHUB_USER_TOKEN']
        user = GithubService.new(token).search_user

        expect(user).to be_a(Hash)
        expect(user).to have_key(:avatar_url)
        expect(user[:avatar_url]).to be_a(String)
      end
    end
  end

  context "starred" do
    it "finds user's starred repos" do
      VCR.use_cassette("github_service_starred") do
        token = ENV['GITHUB_USER_TOKEN']
        nickname = "caward12"
        starred = GithubService.new(token).starred

        expect(starred).to be_an(Array)
        expect(starred.count).to eq(1)
      end
    end
  end

  context "followers" do
    it "finds user's followers" do
      VCR.use_cassette("github_service_followers") do
        token = ENV['GITHUB_USER_TOKEN']
        nickname = "caward12"
        followers = GithubService.new(token).followers

        expect(followers).to be_an(Array)
        expect(followers.first).to be_a(Hash)
        expect(followers.count).to eq(3)
      end
    end
  end

  context "following" do
    it "finds user's following" do
      VCR.use_cassette("github_service_following") do
        token = ENV['GITHUB_USER_TOKEN']
        nickname = "caward12"
        following = GithubService.new(token).following

        expect(following).to be_an(Array)
        expect(following.first).to be_a(Hash)
        expect(following.count).to eq(1)
      end
    end
  end
end