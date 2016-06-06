require "rails_helper"

RSpec.feature "User can logout" do
  scenario "they are redirected to home page" do
    user = login_user

    visit "/links"

    click_on "Log Out"

    expect(current_path).to eq "/"
    expect(page).to have_content "Log In"
  end
end
