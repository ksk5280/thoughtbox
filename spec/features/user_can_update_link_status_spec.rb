require "rails_helper"

RSpec.feature "User can update link status" do
  scenario "they see updated status" do
    user = login_user
    link1 = user.links.create(title: "Google", url: "http://www.google.com")
    visit "/links"

    first('.link').click_on "Mark as Read"
    # expect(link1).to have_css('')

    first('.link').click_on "Mark as Unread"
    # expect(link1).to have_css('')
  end
end

# As an authenticated user who has added links to my Thoughtbox, when I view the link index:
#
# Next to each unread link I should see an option to "Mark as Read".
# Clicking this should update the link appropriately and take me immediately back to the my links.
# Next to each read link I should see an option to "Mark as Unread".
# Clicking this should update the link appropriately and take me immediately back to the my links.
# Read links should be stylistically differentiated from unread links. You could gray them out or use a strike through.
# Note: Later iterations will require that you be able to update the status of the link without reloading the page. Depending on your approach, it might be easier to implement that now.
