require "rails_helper"

RSpec.describe Team, type: :model do
  context "validation" do
    subject { create(:team) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:group_id) }
  end

  context "db" do
    subject { create(:team) }
    it { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:group_id).with_options(null: false) }
    it { is_expected.to have_db_column(:introduce).of_type(:string) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }

    it { should have_db_index(:name) }
    it { should have_db_index(:group_id) }

    it { is_expected.to belong_to(:group) }
  end
end
