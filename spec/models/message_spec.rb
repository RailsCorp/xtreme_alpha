require "rails_helper"

RSpec.describe Message, type: :model do
  context "validation" do
    subject { create(:message) }
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:team_id) }
    it { is_expected.to validate_presence_of(:message_type) }

    it { is_expected.to define_enum_for(:message_type) }
  end

  context "db" do
    subject { create(:message) }
    it { is_expected.to have_db_column(:user_id).with_options(null: false) }
    it { is_expected.to have_db_column(:team_id).with_options(null: false) }
    it { is_expected.to have_db_column(:message_type).with_options(null: false) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }

    it { should have_db_index(:user_id) }
    it { should have_db_index(:team_id) }
    it { should have_db_index(:message_type) }

    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:team) }
  end
end
