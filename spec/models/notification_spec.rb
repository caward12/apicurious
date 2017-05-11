require 'rails_helper'

describe "notification" do
  context "create notifications" do
    it "can create notifications from raw data" do
      VCR.use_cassette("notifications") do
        token = ENV['GITHUB_USER_TOKEN']
        user = GithubUser.search_user(token)
        notifications = user.notifications

        expect(notifications).to be_an(Array)
        expect(notifications.first).to be_a(Notification)
      end
    end

    it "can create mentions from raw data" do
      VCR.use_cassette("mention") do
        token = ENV['GITHUB_USER_TOKEN']
        user = GithubUser.search_user(token)
        mentions = user.mentions

        expect(mentions).to be_an(Array)
        expect(mentions.first).to be_a(Notification)
      end
    end
  end

end