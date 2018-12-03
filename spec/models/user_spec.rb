require "rails_helper"

RSpec.describe User, type: :model do

  valid_emails = %w[
    user@foo.COM
    A_US-ER@f.b.org
    frst.lst@foo.jp
    a+b@baz.cn
  ]
  invalid_emails = %w[
    user@foo,com
    user_at_foo.org
    example.user@foo.
    foo@bar_baz.com
    foo@bar+baz.com
  ]

  context "validation" do
    subject { create(:user) }
    it { is_expected.to validate_presence_of(:provider) }
    it { is_expected.to validate_presence_of(:uid) }
    it { is_expected.to validate_presence_of(:password) }

    it { is_expected.to validate_inclusion_of(:allow_password_change).in_array([true, false]) }

    it { is_expected.to validate_numericality_of(:sign_in_count).only_integer }

    it { is_expected.to validate_length_of(:password).is_at_least(6) }

    it { is_expected.to validate_uniqueness_of(:reset_password_token) }

    it { is_expected.to allow_value(*valid_emails).for(:email) }
    it { is_expected.not_to allow_value(*invalid_emails).for(:email) }
  end

  context "db" do
    subject { create(:user) }
    it { is_expected.to have_db_column(:provider).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:uid).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:encrypted_password).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:reset_password_token).of_type(:string) }
    it { is_expected.to have_db_column(:reset_password_sent_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:current_sign_in_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:last_sign_in_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:current_sign_in_ip).of_type(:string) }
    it { is_expected.to have_db_column(:last_sign_in_ip).of_type(:string) }
    it { is_expected.to have_db_column(:remember_created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:tokens).of_type(:json) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }

    it { should have_db_index(:email) }
    it { should have_db_index(:reset_password_token) }
  end

  context "association" do
    subject { create(:user) }
    it { is_expected.to have_many(:tasks).dependent(:destroy) }
  end
end