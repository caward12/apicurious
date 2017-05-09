require 'rails_helper'

RSpec.describe "User logs in with github" do
  it "they can view profile page" do
    skip
    Capybara.app = Apicurious::Application
    stub_omniauth

    visit "/"

    assert_equal 200, page.status_code
    click_link "Login with Github"
    assert_equal "/dashboard", current_path

    expect(page).to have_content("Colleen Ward")
    expect(page).to have_content("caward12")
    expect(page).to have_css("img[src*='https://avatars3.githubusercontent.com/u/20826865?v=3']")
    expect(page).to have_content("Starred repos: 0")
  end
end