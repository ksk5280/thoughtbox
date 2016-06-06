require "rails_helper"

RSpec.describe "GET api/v1/links" do
  it "responds to json" do
    get "/api/v1/links"
    expect(response).to be_success
  end
end
