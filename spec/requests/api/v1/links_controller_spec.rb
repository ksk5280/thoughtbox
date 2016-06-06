require "rails_helper"

RSpec.describe "GET api/v1/links" do
  it "responds to json" do
    get "/api/v1/links"
    expect(response).to be_success
  end

  it "returns links objects" do
    Link.create(title: "Google", url: "http://www.google.com")
    Link.create(title: "CNN", url: "http://www.cnn.com")
    get "/api/v1/links"

    expect(json_response[0]["title"]).to eq "Google"
    expect(json_response[0]["url"]).to eq "http://www.google.com"
    expect(json_response[1]["title"]).to eq "CNN"
    expect(json_response[1]["url"]).to eq "http://www.cnn.com"
  end
end
