require "rails_helper"

RSpec.feature "User can logout" do
  scenario "they are redirected to home page" do
    user = login_user

    expect(current_path).to eq links_path
    expect(page).to have_content "Welcome #{user.email}!"

    click_on "Log Out"

    expect(current_path).to eq "/"
    expect(page).to have_content "Log In"
  end
end
