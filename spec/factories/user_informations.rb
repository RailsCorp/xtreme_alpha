FactoryBot.define do
  factory :user_information do
    association :information, factory: :information
    introduce { "test" }
    sex { 0 }
    phone_number { "00000000000" }
  end
end
