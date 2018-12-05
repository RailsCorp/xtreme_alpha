require 'rails_helper'

RSpec.describe Group, type: :model do
  context "validation" do
    subject { create(:group) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:group_type) }
    it { is_expected.to define_enum_for(:group_type) }
  end

  context "db" do
    subject { create(:group) }
    it { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:group_type).with_options(null: false) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }

    it { should have_db_index(:name) }

    it { is_expected.to have_many(:members).dependent(:destroy) }
    it { is_expected.to have_many(:users).through(:members) }
  end
end
