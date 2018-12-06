require 'rails_helper'

RSpec.describe TaskUser, type: :model do
  context "validation" do
    subject { create(:task_user) }
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:task_id) }
  end

  context "db" do
    subject { create(:task_user) }
    it { is_expected.to have_db_column(:user_id).with_options(null: false) }
    it { is_expected.to have_db_column(:task_id).with_options(null: false) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }

    it { should have_db_index(:user_id) }
    it { should have_db_index(:task_id) }

    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:task) }
  end
end
