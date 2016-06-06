require "rails_helper"

RSpec.feature "User can logout" do
  scenario "they are redirected to home page" do
    user = User.create(
      email: "email@example.com",
      password: "password",
      password_confirmation: "password"
    )

    visit "/"
    click_on "Log In"

    expect(current_path).to eq login_path

    fill_in "Email", with: "email@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Log In"

    expect(current_path).to eq links_path
    expect(page).to have_content "Welcome #{user.email}!"

    click_on "Log Out"

    expect(current_path).to eq "/"
    expect(page).to have_content "Log In"
  end
end
