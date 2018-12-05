require "rails_helper"

RSpec.describe "Tasks Controller Requests", type: :request do
  let(:image) { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/images/test.jpg')) }
  let(:params) {
    {
      groups: {
        name: "test1",
        group_type: "students",
        image: image
      }
    }
  }
  let(:params1) {
    {
      groups: {
        name: "test2",
        group_type: "companies",
        image: image
      }
    }
  }
  describe "success" do
  
    it "#show action" do
      user = create(:user)
      @group = create(:group)
      create(:member, user_id: user.id, group_id: @group.id)
      get api_group_path(@group), headers: auth_headers
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq("application/json")
      body = JSON.parse(response.body)
      expect(body["name"]).to eq("MyString")
    end
  
    it "#create action" do
      user = create(:user)
      expect do
        post api_groups_path, params: params, headers: auth_headers
      end.to change(
        Group, :count
      ).by(1)
      expect(response).to have_http_status(201)
      expect(response.content_type).to eq("application/json")
      body = JSON.parse(response.body)
      expect(body["name"]).to eq("test1")
      expect(body["group_type"]).to eq("students")
    end
  
    it "#update action" do
      user = create(:user)
      @group = create(:group)
      create(:member, user_id: user.id, group_id: @group.id)
      expect do
        put api_group_path(@group), params: params1, headers: auth_headers
      end.to_not change(Group, :count)
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq("application/json")
      body = JSON.parse(response.body)
      expect(body["name"]).to eq("test2")
      expect(body["group_type"]).to eq("companies")
    end
  
    it "#destroy action" do
      user = create(:user)
      @group = create(:group)
      create(:member, user_id: user.id, group_id: @group.id)
      expect do
        delete api_group_path(@group), headers: auth_headers
      end.to change(
        Group, :count
      ).by(-1).and change(
        Member, :count
      ).by(-1)
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq("application/json")
    end
  end

  describe "failure" do
    it "#show action" do
      @group = create(:group)
      get api_group_path(@group)
      expect(response).to have_http_status(401)
      expect(response.content_type).to eq("application/json")
    end

    it "#create action" do
      post api_groups_path
      expect(response).to have_http_status(401)
      expect(response.content_type).to eq("application/json")
    end

    it "#update action" do
      @group = create(:group)
      put api_group_path(@group)
      expect(response).to have_http_status(401)
      expect(response.content_type).to eq("application/json")
    end

    it "#delete action" do
      @group = create(:group)
      delete api_group_path(@group)
      expect(response).to have_http_status(401)
      expect(response.content_type).to eq("application/json")
    end
  end
end