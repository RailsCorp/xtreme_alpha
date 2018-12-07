require "rails_helper"

RSpec.describe "Tasks Controller Requests", type: :request do
  let(:image) { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/images/test.jpg")) }
  let(:params1) {
    {
      teams: {
        name: "test1",
        image: image,
        introduce: "test1"
      }
    }
  }
  let(:params2) {
    {
      teams: {
        name: "test2",
        image: image,
        introduce: "test2"
      }
    }
  }
  describe "success" do
    before do
      @user = create(:user)
      @group = create(:group)
      create(:member, group_id: @group.id, user_id: @user.id)
    end

    it "#index action" do
      get api_group_teams_path(@group), headers: auth_headers
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq("application/json")
    end

    it "#show action" do
      @team = create(:team, group_id: @group.id)
      get api_group_team_path(@group, @team), headers: auth_headers
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq("application/json")
    end

    it "#create action" do
      expect do
        post api_group_teams_path(@group), params: params1, headers: auth_headers
      end.to change(
        Team, :count
      ).by(1)
      expect(response).to have_http_status(201)
      expect(response.content_type).to eq("application/json")
      body = JSON.parse(response.body)
      expect(body["name"]).to eq "test1"
      expect(body["introduce"]).to eq "test1"
    end

    it "#update action" do
      @team = create(:team, group_id: @group.id)
      expect do
        put api_group_team_path(@group, @team), params: params2, headers: auth_headers
      end.to_not change(
        Team, :count
      )
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq("application/json")
      body = JSON.parse(response.body)
      expect(body["name"]).to eq "test2"
      expect(body["introduce"]).to eq "test2"
    end

    it "#destroy action" do
      @team = create(:team, group_id: @group.id)
      puts @team
      puts @team.id
      expect do
        delete api_group_team_path(@group, @team), headers: auth_headers
      end.to change(
        Team, :count
      ).by(-1)
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq("application/json")
    end
  end

  describe "failure" do
    before do
      @user = create(:user)
      @group = create(:group)
      create(:member, group_id: @group.id, user_id: @user.id)
    end

    it "#index action" do
      get api_group_teams_path(@group)
      expect(response).to have_http_status(401)
      expect(response.content_type).to eq("application/json")
    end

    it "#show action" do
      @team = create(:team, group_id: @group.id)
      get api_group_team_path(@group, @team)
      expect(response).to have_http_status(401)
      expect(response.content_type).to eq("application/json")
    end

    it "#create action" do
      post api_group_teams_path(@group), params: params1
      expect(response).to have_http_status(401)
      expect(response.content_type).to eq("application/json")
    end

    it "#update action" do
      @team = create(:team, group_id: @group.id)
      put api_group_team_path(@group, @team), params: params2
      expect(response).to have_http_status(401)
      expect(response.content_type).to eq("application/json")
    end

    it "#destroy action" do
      @team = create(:team, group_id: @group.id)
      delete api_group_team_path(@group, @team)
      expect(response).to have_http_status(401)
      expect(response.content_type).to eq("application/json")
    end
  end
end
