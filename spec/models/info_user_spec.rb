require "rails_helper"

RSpec.describe InfoUser, type: :model do
  context "validation" do
    subject { create(:info_user) }
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:information_id) }
  end

  context "db" do
    subject { create(:info_user) }
    it { is_expected.to have_db_column(:user_id).with_options(null: false) }
    it { is_expected.to have_db_column(:information_id).with_options(null: false) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }

    it { should have_db_index(:user_id) }
    it { should have_db_index(:information_id) }

    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:information) }
  end
end
