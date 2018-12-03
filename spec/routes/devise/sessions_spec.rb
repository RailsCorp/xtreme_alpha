require "rails_helper"

describe "Devise Sessions Routing", type: :routing do
  it "GET api/auth/sign_in new action" do
    expect(get: "api/auth/sign_in").to route_to(action: "new", controller: "devise_token_auth/sessions")
  end

  it "POST api/auth/sign_in create action" do
    expect(post: "api/auth/sign_in").to route_to(action: "create", controller: "devise_token_auth/sessions")
  end

  it "DELETE api/auth/sign_out destroy action" do
    expect(delete: "api/auth/sign_out").to route_to(action: "destroy", controller: "devise_token_auth/sessions")
  end
end