require "rails_helper"

describe Api::Messages::CreateUsecase do
  let(:image) { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/images/test.jpg")) }
  let(:file) { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/images/test.pdf")) }
  let(:text_params) {
    {
      message_type: "text",
      value: {
        text: "hello world!"
      }
    }
  }
  
  let(:image_params) {
    {
      message_type: "image",
      value: {
        image: image
      }
    }
  }

  let(:file_params) {
    {
      message_type: "file",
      value: {
        file: file
      }
    }
  }

  describe "Api::Messages::CreateUSecase" do
    before do
      @user = create(:user)
      @group = create(:group)
      create(:member, user_id: @user.id, group_id: @group.id)
      @team = create(:team, group_id: @group.id)
    end
    it "MessageText Success" do
      expect do
        @message = described_class.new(text_params, @team.id, @user.id).execute
      end.to change(
        Message, :count
      ).by(1).and change(
        MessageText, :count
      ).by(1)

      expect(@message.text).to eq("hello world!")
    end

    it "MessageImage Success" do
      expect do
        @message = described_class.new(image_params, @team.id, @user.id).execute
      end.to change(
        Message, :count
      ).by(1).and change(
        MessageImage, :count
      ).by(1)
      
      expect(@message.image.filename).to eq("test.jpg")
      expect(@message.image.name).to eq("image")
    end

    it "MessageFile Success" do
      expect do
        @message = described_class.new(file_params, @team.id, @user.id).execute
      end.to change(
        Message, :count
      ).by(1).and change(
        MessageFile, :count
      ).by(1)
      
      expect(@message.file.filename).to eq("test.pdf")
      expect(@message.file.name).to eq("file")
    end
  end
end
