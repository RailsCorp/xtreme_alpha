require "rails_helper"

RSpec.describe Member, type: :model do
  context "validation" do
    subject { create(:member) }
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:group_id) }
  end

  context "db" do
    subject { create(:member) }
    it { is_expected.to have_db_column(:user_id).with_options(null: false) }
    it { is_expected.to have_db_column(:group_id).with_options(null: false) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }

    it { should have_db_index(:user_id) }
    it { should have_db_index(:group_id) }

    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:group) }
  end
end
