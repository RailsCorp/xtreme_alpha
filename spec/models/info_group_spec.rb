require 'rails_helper'

RSpec.describe InfoGroup, type: :model do
  context "validation" do
    subject { create(:info_group) }
    it { is_expected.to validate_presence_of(:group_id) }
    it { is_expected.to validate_presence_of(:information_id) }
  end

  context "db" do
    subject { create(:info_group) }
    it { is_expected.to have_db_column(:group_id).with_options(null: false) }
    it { is_expected.to have_db_column(:information_id).with_options(null: false) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }

    it { should have_db_index(:group_id) }
    it { should have_db_index(:information_id) }

    it { is_expected.to belong_to(:group) }
    it { is_expected.to belong_to(:information) }
  end
end
