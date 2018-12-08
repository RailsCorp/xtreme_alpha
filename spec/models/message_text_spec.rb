require "rails_helper"

RSpec.describe MessageText, type: :model do
  context "validation" do
    subject { create(:message_text) }
    it { is_expected.to validate_presence_of(:message_id) }
    it { is_expected.to validate_presence_of(:text) }
  end

  context "db" do
    subject { create(:message_text) }
    it { is_expected.to have_db_column(:message_id).with_options(null: false) }
    it { is_expected.to have_db_column(:text).with_options(null: false) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }

    it { should have_db_index(:message_id) }

    it { is_expected.to belong_to(:message) }
  end
end
