require "rails_helper"

describe "Tasks Routing", type: :routing do
  it "GET index action" do
    expect(get: "api/tasks").to route_to "api/tasks#index"
  end
  it "POST create action" do
    expect(post: "api/tasks").to route_to "api/tasks#create"
  end

  it "PUT update action" do
    expect(put: "api/tasks/1").to route_to(action: "update", controller: "api/tasks", id: "1")
  end

  it "DELETE destroy action" do
    expect(delete: "api/tasks/1").to route_to(action: "destroy", controller: "api/tasks", id: "1")
  end

  it "GET show action" do
    expect(get: "api/tasks/1").to route_to(action: "show", controller: "api/tasks", id: "1")
  end
end
