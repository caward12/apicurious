require 'rails_helper'

RSpec.describe "User logs in with github" do
  it "they can log in with github" do
    Capybara.app = Apicurious::Application
    stub_omniauth

    visit "/"

    assert_equal 200, page.status_code
    click_link "Login with Github"
    assert_equal "/dashboard", current_path
    save_and_open_page
    assert page.has_content?("Colleen's Dashboard")
    assert page.has_link?("Logout")
  end


end