require "rails_helper"

RSpec.feature "User can sign in" do
  scenario "they see user dashboard" do
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
    expect(page).to have_content "Welcome #{user.email}!"
  end
end



# If I click "Sign Up", I should be taken to a user form where I can enter an email address, a password, and a password confirmation.

# I cannot sign up with an email address that has already been used.
# Password and confirmation must match.
# Upon submitting this information, I should be logged in via a cookie and redirected to the "Links Index" page.
