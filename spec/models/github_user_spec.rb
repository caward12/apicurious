require 'rails_helper'

describe 'GithubUser' do
  context 'avatar_url' do
    it "can find photo for single user" do
      VCR.use_cassette("github_user") do
        token = ENV['GITHUB_USER_TOKEN']
        user = GithubUser.search_user(token)
        expect(user.avatar_url).to eq("https://avatars3.githubusercontent.com/u/20826865?v=3")
      end
    end
  end

  context 'starred' do
    it "can find starred repos" do
      VCR.use_cassette("github_user_starred") do
        token = ENV['GITHUB_USER_TOKEN']
        user = GithubUser.search_user(token)
        starred = user.starred(token)

        expect(starred).to be_an(Array)
        expect(starred.first).to be_a(Repo)
        expect(starred.count).to eq(1)
      end
    end
  end

  context 'followers' do
    it "can find followers" do
      VCR.use_cassette("github_user_followers") do
        token = ENV['GITHUB_USER_TOKEN']
        user = GithubUser.search_user(token)
        followers = user.followers(token)

        expect(followers).to be_an(Array)
        expect(followers.count).to eq(3)
        expect(followers.first.nickname).to eq("Carmer")
      end
    end
  end

  context 'following' do
    it "can find following" do
      VCR.use_cassette("github_user_following") do
        token = ENV['GITHUB_USER_TOKEN']
        user = GithubUser.search_user(token)
        following = user.following(token)

        expect(following).to be_an(Array)
        expect(following.count).to eq(1)
      end
    end
  end

  context 'repos' do
    it "can find all repos" do
      VCR.use_cassette("github_user_repos") do
        token = ENV['GITHUB_USER_TOKEN']
        user = GithubUser.search_user(token)
        repos = user.repos(token)

        expect(repos).to be_an(Array)
        expect(repos.first).to be_a(Repo)
        expect(repos.count).to eq(30)
      end
    end
  end

  context 'orgs' do
    it "can find all organizations" do
      VCR.use_cassette("github_user_orgs") do
        token = ENV['GITHUB_USER_TOKEN']
        user = GithubUser.search_user(token)
        orgs = user.organizations(token)

        expect(orgs).to be_an(Array)
        expect(orgs.count).to eq(0)
      end
    end
  end
end