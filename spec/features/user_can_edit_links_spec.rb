require "rails_helper"

RSpec.feature "User can edit links", js: true do
  scenario "they see edited link" do
    user = login_user
    link = user.links.create(title: "Google", url: "http://www.google.com")

    visit "/links"

    click_on "Edit"
  end
end
