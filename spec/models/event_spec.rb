require 'rails_helper'

describe "event" do
  context "create events" do
    it "can create recent events from raw data" do
      VCR.use_cassette("events") do
        token = ENV['GITHUB_USER_TOKEN']
        user = GithubUser.search_user(token)
        nickname = "caward12"
        events = user.events(nickname)

        expect(events).to be_an(Array)
        expect(events.first).to be_an(Event)
        expect(events.count).to eq(30)
      end
    end
  end

end