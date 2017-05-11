require 'rails_helper'

describe "organization" do
  context "create organizations" do
    it "can create organizations from raw data" do
      VCR.use_cassette("orgs") do
        token = ENV['GITHUB_USER_TOKEN']
        user = GithubUser.search_user(token)
        orgs = user.organizations

        expect(orgs).to be_an(Array)
        expect(orgs.count).to eq(0)
      end
    end
  end

end