require "rails_helper"

describe "Tasks Routing", type: :routing do
  context "users" do
    it "GET index action" do
      expect(get: "api/users/1/tasks").to route_to(action: "index", controller: "api/tasks", user_id: "1")
    end
    it "POST create action" do
      expect(post: "api/users/1/tasks").to route_to(action: "create", controller: "api/tasks", user_id: "1")
    end
  
    it "PUT update action" do
      expect(put: "api/users/1/tasks/1").to route_to(action: "update", controller: "api/tasks", user_id: "1", id: "1")
    end
  
    it "DELETE destroy action" do
      expect(delete: "api/users/1/tasks/1").to route_to(action: "destroy", controller: "api/tasks", user_id: "1", id: "1")
    end
  
    it "GET show action" do
      expect(get: "api/users/1/tasks/1").to route_to(action: "show", controller: "api/tasks", user_id: "1", id: "1")
    end
  end

  context "groups" do
    it "GET index action" do
      expect(get: "api/groups/1/tasks").to route_to(action: "index", controller: "api/tasks", group_id: "1")
    end

    it "POST create action" do
      expect(post: "api/groups/1/tasks").to route_to(action: "create", controller: "api/tasks", group_id: "1")
    end
  
    it "PUT update action" do
      expect(put: "api/groups/1/tasks/1").to route_to(action: "update", controller: "api/tasks", group_id: "1", id: "1")
    end
  
    it "DELETE destroy action" do
      expect(delete: "api/groups/1/tasks/1").to route_to(action: "destroy", controller: "api/tasks", group_id: "1", id: "1")
    end
  
    it "GET show action" do
      expect(get: "api/groups/1/tasks/1").to route_to(action: "show", controller: "api/tasks", group_id: "1", id: "1")
    end
  end
end
