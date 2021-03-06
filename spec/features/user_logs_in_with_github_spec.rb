require 'rails_helper'

RSpec.describe "User logs in with github" do
  it "they can log in with github" do
    VCR.use_cassette("user_login") do
      Capybara.app = Apicurious::Application
      stub_omniauth

      visit "/"

      assert_equal 200, page.status_code
      click_link "Login with Github"
    
      assert_equal "/dashboard", current_path
      assert page.has_content?("Colleen Ward")
      assert page.has_link?("Logout")
    end
  end
end