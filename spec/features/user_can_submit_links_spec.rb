require "rails_helper"

RSpec.feature "Authenticated user can submit links", js: true do
  scenario "they see links" do
    user = login_user

    visit "/links"
    fill_in :link_title, with: "Mod 4 Assessment"
    fill_in :link_url, with: "https://gist.github.com/stevekinney/82831c5b25029415ce8b"
    click_on "Submit Link"

    visit "/links"
    within (".links") do
      expect(page).to have_content "https://gist.github.com/stevekinney/82831c5b25029415ce8b"
    end
  end
end
