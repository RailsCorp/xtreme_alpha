require "rails_helper"

describe "Users Routing", type: :routing do
  it "GET index action" do
    expect(get: "api/users/1").to route_to(action: "show", controller: "api/users", id: "1")
  end
end