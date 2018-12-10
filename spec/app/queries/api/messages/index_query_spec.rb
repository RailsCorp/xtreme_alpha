require "rails_helper"

describe Api::Messages::IndexQuery do
  let(:image) { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/images/test.jpg")) }
  let(:file) { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/images/test.pdf")) }
  describe "Api::Messages::IndexQuery" do
    before do
      @user = create(:user)
      @group = create(:group)
      create(:member, user_id: @user.id, group_id: @group.id)
      @team = create(:team, group_id: @group.id)
    end
    it "MessageText Success" do
      3.times do |_time|
        message = create(:message, team_id: @team.id, user_id: @user.id, message_type: "text")
        create(:message_text, message_id: message.id, text: "hello")
      end
      messages = described_class.new(@team.id).execute
      expect(messages.count).to eq 3
      expect(messages[0].message_text.text).to eq("hello")
    end

    it "MessageImage Success" do
      3.times do |_time|
        message = create(:message, team_id: @team.id, user_id: @user.id, message_type: "image")
        create(:message_image, message_id: message.id, image: image)
      end
      messages = described_class.new(@team.id).execute
      expect(messages.count).to eq 3
      expect(messages[0].image.filename).to eq("test.jpg")
      expect(messages[0].image.name).to eq("image")
    end

    it "MessageFile Success" do
      3.times do |_time|
        message = create(:message, team_id: @team.id, user_id: @user.id, message_type: "image")
        create(:message_file, message_id: message.id, file: file)
      end
      messages = described_class.new(@team.id).execute
      expect(messages.count).to eq 3
      expect(messages[0].file.filename).to eq("test.pdf")
      expect(messages[0].file.name).to eq("file")
    end
  end
end
