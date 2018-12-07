require "rails_helper"

describe "Teams Routing", type: :routing do
  it "GET index action" do
    expect(get: "api/groups/1/teams").to route_to(action: "index", controller: "api/teams", group_id: "1")
  end
  it "POST create action" do
    expect(post: "api/groups/1/teams").to route_to(action: "create", controller: "api/teams", group_id: "1")
  end

  it "PUT update action" do
    expect(put: "api/groups/1/teams/1").to route_to(action: "update", controller: "api/teams", group_id: "1", id: "1")
  end

  it "DELETE destroy action" do
    expect(delete: "api/groups/1/teams/1").to route_to(action: "destroy", controller: "api/teams", group_id: "1", id: "1")
  end

  it "GET show action" do
    expect(get: "api/groups/1/teams/1").to route_to(action: "show", controller: "api/teams", group_id: "1", id: "1")
  end
end
