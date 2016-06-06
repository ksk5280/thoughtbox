require 'rails_helper'

RSpec.describe Link, type: :model do
  it { should validate_presence_of :title }
  it { should validate_presence_of :url }

  scenario "it has a default read status of false" do
    link = Link.create(title: "Google", url: "www.google.com")
    expect(link.read).to be_falsey
  end
end
