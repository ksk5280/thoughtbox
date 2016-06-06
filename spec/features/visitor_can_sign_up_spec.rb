require "rails_helper"

RSpec.feature "Unregistered visitor can sign up" do
  scenario "they see the links page" do
    visit "/"

    expect(page).to have_content "Log In or Sign Up"
    click_on "Sign Up"

    expect(current_path).to eq new_user_path

    fill_in "Email", with: "email@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Create Account"

    user = User.last

    expect(current_path).to eq links_path
    expect(page).to have_content "Your account has been successfully created email@example.com!"
  end
end
