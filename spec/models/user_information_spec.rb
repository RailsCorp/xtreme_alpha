require "rails_helper"

RSpec.describe UserInformation, type: :model do
  valid_phone_numbers = %w[
    09039999999
    0325694406
    0111908736
    05090902318
  ]
  invalid_phone_numbers = %w[
    000
    jndsjvkdjd
    sdkv0----k
    0000000000-
    foo@bar+baz.com
  ]

  context "validation" do
    subject { create(:user_information) }
    it { is_expected.to allow_value(*valid_phone_numbers).for(:phone_number) }
    it { is_expected.not_to allow_value(*invalid_phone_numbers).for(:phone_number) }
  end

  context "association" do
    subject { create(:user_information) }
    it { is_expected.to belong_to(:information) }
  end
end
