require "rails_helper"

describe Api::Messages::IndexQuery do
  let(:image) { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/images/test.jpg")) }
  describe "Api::Messages::IndexQuery" do
    it "MessageText Success" do
      user = create(:user)
      group = create(:group)
      create(:member, user_id: user.id, group_id: group.id)
      team = create(:team, group_id: group.id)
      3.times do |_time|
        message = create(:message, team_id: team.id, user_id: user.id, message_type: "text")
        create(:message_text, message_id: message.id, text: "hello")
      end
      messages = described_class.new(team.id).execute
      expect(messages.count).to eq 3
      expect(messages[0].message_text.text).to eq("hello")
    end

    it "MessageImage" do
      user = create(:user)
      group = create(:group)
      create(:member, user_id: user.id, group_id: group.id)
      team = create(:team, group_id: group.id)
      3.times do |_time|
        message = create(:message, team_id: team.id, user_id: user.id, message_type: "image")
        create(:message_image, message_id: message.id, image: image)
      end
      messages = described_class.new(team.id).execute
      expect(messages.count).to eq 3
      expect(messages[0].image.filename).to eq("test.jpg")
      expect(messages[0].image.name).to eq("image")
    end
  end
end
