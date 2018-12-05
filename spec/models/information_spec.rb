require "rails_helper"

RSpec.describe Information, type: :model do
  context "validation" do
    subject { create(:information) }
    it { is_expected.to validate_presence_of(:info_type) }
    it { is_expected.to define_enum_for(:info_type) }
  end

  context "db" do
    subject { create(:information) }
    it { is_expected.to have_db_column(:info_type).with_options(null: false) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }

    it { should have_db_index(:info_type) }

    it { is_expected.to have_one(:info_user).dependent(:destroy) }
    it { is_expected.to have_one(:user).through(:info_user) }
    it { is_expected.to have_one(:info_group).dependent(:destroy) }
    it { is_expected.to have_one(:group).through(:info_group) }
  end
end
