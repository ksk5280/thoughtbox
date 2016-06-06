require "rails_helper"

RSpec.feature "User can update link status", js: true do
  scenario "they see updated status" do
    user = login_user
    link1 = user.links.create(title: "Google", url: "http://www.google.com")
    visit "/links"

    click_on "Mark as Read"

    click_on "Mark as Unread"
  end
end
