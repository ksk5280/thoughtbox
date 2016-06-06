require "rails_helper"

RSpec.feature "Registered user can log in" do
  scenario "they see the links page" do
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
  end

  context "they enter the wrong password" do
    scenario "they stay on login page" do
      user = User.create(
        email: "email@example.com",
        password: "password",
        password_confirmation: "password"
      )

      visit login_path
      fill_in "Email", with: "email@example.com"
      fill_in "Password", with: "pazwurd"
      click_on "Log In"

      expect(current_path).to eq login_path
    end
  end
end
