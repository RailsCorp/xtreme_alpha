require "rails_helper"

describe "Devise Registrations Routing", type: :routing do
  it "GET api/auth/cancel cancel action" do
    expect(get: "api/auth/cancel").to route_to(action: "cancel", controller: "api/auth/registrations")
  end

  it "GET api/auth/sign_up new action" do
    expect(get: "api/auth/sign_up").to route_to(action: "new", controller: "api/auth/registrations")
  end

  it "GET api/auth/edit edit action" do
    expect(get: "api/auth/edit").to route_to(action: "edit", controller: "api/auth/registrations")
  end

  it "POST api/auth/sign_in create action" do
    expect(post: "api/auth").to route_to(action: "create", controller: "api/auth/registrations")
  end

  it "DELETE api/auth/sign_out destroy action" do
    expect(delete: "api/auth").to route_to(action: "destroy", controller: "api/auth/registrations")
  end

  it "PUT api/auth/sign_out destroy action" do
    expect(put: "api/auth").to route_to(action: "update", controller: "api/auth/registrations")
  end

  it "GET api/auth/validate_token new action" do
    expect(get: "api/auth/validate_token").to route_to(action: "validate_token", controller: "devise_token_auth/token_validations")
  end
end
