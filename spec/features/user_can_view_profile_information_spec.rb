require 'rails_helper'

RSpec.describe "User logs in with github" do
  it "they can view profile page" do
    Capybara.app = Apicurious::Application
    stub_omniauth

    visit "/"

    assert_equal 200, page.status_code
    click_link "Login with Github"
    assert_equal "/dashboard", current_path


  end
end