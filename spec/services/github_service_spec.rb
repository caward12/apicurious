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
        following = GithubService.new(token).following

        expect(following).to be_an(Array)
        expect(following.first).to be_a(Hash)
        expect(following.count).to eq(1)
      end
    end
  end

  context "repos" do
    it "finds user's repositories" do
      VCR.use_cassette("github_service_repos") do
        token = ENV['GITHUB_USER_TOKEN']
        repos = GithubService.new(token).repos

        expect(repos).to be_an(Array)
        expect(repos.first).to be_a(Hash)
        expect(repos.count).to eq(30)
      end
    end
  end

  context "organizations" do
    it "find's user's organizations" do
      VCR.use_cassette("github_service_orgs") do
        token = ENV['GITHUB_USER_TOKEN']
        orgs = GithubService.new(token).organizations

        expect(orgs).to be_an(Array)
        expect(orgs.count).to eq(0)
      end
    end
  end
end