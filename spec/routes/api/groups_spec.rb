require "rails_helper"

describe "Groups Routing", type: :routing do
  it "POST create action" do
    expect(post: "api/groups").to route_to(action: "create", controller: "api/groups", format: "json")
  end

  it "PUT update action" do
    expect(put: "api/groups/1").to route_to(action: "update", controller: "api/groups", id: "1", format: "json")
  end

  it "DELETE destroy action" do
    expect(delete: "api/groups/1").to route_to(action: "destroy", controller: "api/groups", id: "1", format: "json")
  end

  it "GET show action" do
    expect(get: "api/groups/1").to route_to(action: "show", controller: "api/groups", id: "1", format: "json")
  end
end
