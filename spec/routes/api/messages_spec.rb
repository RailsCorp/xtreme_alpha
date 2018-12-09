require "rails_helper"

describe "Messages Routing", type: :routing do
  it "GET index action" do
    expect(get: "api/groups/1/teams/1/messages").to route_to(action: "index", controller: "api/messages", group_id: "1", team_id: "1", format: "json")
  end

  it "POST create action" do
    expect(post: "api/groups/1/teams/1/messages").to route_to(action: "create", controller: "api/messages", group_id: "1", team_id: "1", format: "json")
  end

  it "DELETE destroy action" do
    expect(delete: "api/groups/1/teams/1/messages/1").to route_to(action: "destroy", controller: "api/messages", id: "1", group_id: "1", team_id: "1", format: "json")
  end
end
