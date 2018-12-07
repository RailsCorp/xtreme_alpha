require "rails_helper"

describe "Devise Passwords Routing", type: :routing do
  it "GET api/auth/password/new new action" do
    expect(get: "api/auth/password/new").to route_to(action: "new", controller: "devise_token_auth/passwords", format: "json")
  end

  it "GET api/auth/password/edit edit action" do
    expect(get: "api/auth/password/edit").to route_to(action: "edit", controller: "devise_token_auth/passwords", format: "json")
  end

  it "POST api/auth/password create action" do
    expect(post: "api/auth/password").to route_to(action: "create", controller: "devise_token_auth/passwords", format: "json")
  end

  it "PUT api/auth/password destroy action" do
    expect(put: "api/auth/password").to route_to(action: "update", controller: "devise_token_auth/passwords", format: "json")
  end
end
