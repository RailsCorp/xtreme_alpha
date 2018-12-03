require "rails_helper"

RSpec.describe SuccessTaskLog, type: :model do
  context "validation" do
    subject { create(:success_task_log) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:task_id) }
  end

  context "db" do
    subject { create(:success_task_log) }
    it { is_expected.to have_db_column(:title).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:task_id).with_options(null: false) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }

    it { should have_db_index(:title) }
    it { should have_db_index(:task_id) }

    it { is_expected.to belong_to(:task) }
  end
end
