require "rails_helper"

RSpec.describe "Tasks Controller Requests", type: :request do
  let(:image) { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/images/test.jpg")) }
  let(:file) { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/images/test.pdf")) }
  let(:text_params) {
    {
      messages: {
        message_type: "text",
        value: {
          text: "hello"
        }
      }
    }
  }
  let(:image_params) {
    {
      messages: {
        message_type: "image",
        value: {
          image: image
        }
      }
    }
  }
  let(:file_params) {
    {
      messages: {
        message_type: "file",
        value: {
          file: file
        }
      }
    }
  }
  describe "success" do
    it "#index action" do
      @user = create(:user)
      @group = create(:group)
      create(:member, user_id: @user.id, group_id: @group.id)
      @team = create(:team, group_id: @group.id)
      3.times do |_time|
        message = create(:message, team_id: @team.id, user_id: @user.id, message_type: "text")
        create(:message_text, message_id: message.id, text: "hello")
      end
      3.times do |_time|
        message = create(:message, team_id: @team.id, user_id: @user.id, message_type: "image")
        create(:message_image, message_id: message.id, image: image)
      end
      3.times do |_time|
        message = create(:message, team_id: @team.id, user_id: @user.id, message_type: "file")
        create(:message_file, message_id: message.id, file: file)
      end
      get api_group_team_messages_path(@group, @team), headers: auth_headers
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq("application/json")
      body = JSON.parse(response.body)
      expect(body.length).to eq 9
      expect(body[0]["type"]).to eq("text")
      expect(body[3]["value"]["image"]["name"]).to eq("image")
    end

    it "#create action MessageText" do
      @user = create(:user)
      @group = create(:group)
      create(:member, user_id: @user.id, group_id: @group.id)
      @team = create(:team, group_id: @group.id)
      expect do
        post api_group_team_messages_path(@group, @team), params: text_params, headers: auth_headers
      end.to change(
        Message, :count
      ).by(1).and change(
        MessageText, :count
      )
      expect(response).to have_http_status(201)
      expect(response.content_type).to eq("application/json")
      body = JSON.parse(response.body)
      expect(body["type"]).to eq("text")
      expect(body["value"]["text"]).to eq("hello")
    end

    it "#create action MessageImage" do
      @user = create(:user)
      @group = create(:group)
      create(:member, user_id: @user.id, group_id: @group.id)
      @team = create(:team, group_id: @group.id)
      expect do
        post api_group_team_messages_path(@group, @team), params: image_params, headers: auth_headers
      end.to change(
        Message, :count
      ).by(1).and change(
        MessageImage, :count
      )
      expect(response).to have_http_status(201)
      expect(response.content_type).to eq("application/json")
      body = JSON.parse(response.body)
      expect(body["type"]).to eq("image")
      expect(body["value"]["image"]["name"]).to eq("image")
    end

    it "#create action MessageFile" do
      @user = create(:user)
      @group = create(:group)
      create(:member, user_id: @user.id, group_id: @group.id)
      @team = create(:team, group_id: @group.id)
      expect do
        post api_group_team_messages_path(@group, @team), params: file_params, headers: auth_headers
      end.to change(
        Message, :count
      ).by(1).and change(
        MessageFile, :count
      )
      expect(response).to have_http_status(201)
      expect(response.content_type).to eq("application/json")
      body = JSON.parse(response.body)
      expect(body["type"]).to eq("file")
      expect(body["value"]["file"]["name"]).to eq("file")
    end

    it "#destroy action" do
      @user = create(:user)
      @group = create(:group)
      create(:member, user_id: @user.id, group_id: @group.id)
      @team = create(:team, group_id: @group.id)
      @message = create(:message, message_type: "text", user_id: @user.id, team_id: @team.id)
      create(:message_text, message_id: @message.id)
      expect do
        delete api_group_team_message_path(@group, @team, @message), headers: auth_headers
      end.to change(
        Message, :count
      ).by(-1).and change(
        MessageText, :count
      ).by(-1)
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq("application/json")
    end
  end

  describe "failure" do
    it "#show action" do
      @user = create(:user)
      @group = create(:group)
      create(:member, user_id: @user.id, group_id: @group.id)
      @team = create(:team, group_id: @group.id)
      get api_group_team_messages_path(@group, @team)
      expect(response).to have_http_status(401)
      expect(response.content_type).to eq("application/json")
    end

    it "#create action" do
      @user = create(:user)
      @group = create(:group)
      create(:member, user_id: @user.id, group_id: @group.id)
      @team = create(:team, group_id: @group.id)
      post api_group_team_messages_path(@group, @team), params: text_params
      expect(response).to have_http_status(401)
      expect(response.content_type).to eq("application/json")
    end

    it "#delete action" do
      @user = create(:user)
      @group = create(:group)
      create(:member, user_id: @user.id, group_id: @group.id)
      @team = create(:team, group_id: @group.id)
      @message = create(:message, message_type: "text", user_id: @user.id, team_id: @team.id)
      create(:message_text, message_id: @message.id)
      delete api_group_team_message_path(@group, @team, @message)
      expect(response).to have_http_status(401)
      expect(response.content_type).to eq("application/json")
    end
  end
end
