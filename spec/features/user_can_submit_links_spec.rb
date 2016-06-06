require "rails_helper"

RSpec.feature "Authenticated user can submit links" do
  scenario "they see links" do
    user = login_user

    visit "/links"
    fill_in :link, with: "https://gist.github.com/stevekinney/82831c5b25029415ce8b"
    click_on "Submit Link"

    within (".links") do
      expect(page).to have_content "https://gist.github.com/stevekinney/82831c5b25029415ce8b"
    end
  end
end
# As an authenticated user viewing the main page (links#index), I should see a simple form to submit a link.
#
# The Link model should include:
#
# A valid URL location for the link
# A title for the link
# Additionally, all links have a read status that is either true or false. This column will default to false.
#
# Submitting an invalid link should result in an error message being displayed.
#
# Hint: Use Ruby's built in URI.parse method to determine if a link is a valid URL or not. This StackOverflow post has more information. Alternatively, you could use a gem like this one.
#
# Once a link has been submitted, loading the index page should display all of my links.
