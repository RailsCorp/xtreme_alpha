require "rails_helper"

RSpec.describe Task, type: :model do
  context "validation" do
    subject { create(:task) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_inclusion_of(:is_finished).in_array([true, false]) }
  end

  context "db" do
    subject { create(:task) }
    it { is_expected.to have_db_column(:title).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:content).of_type(:text) }
    it { is_expected.to have_db_column(:is_finished).of_type(:boolean).with_options(null: false) }
    it { is_expected.to have_db_column(:deadline).of_type(:datetime) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }

    it { should have_db_index(:title) }
  end
end
