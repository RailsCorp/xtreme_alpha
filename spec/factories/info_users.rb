FactoryBot.define do
  factory :info_user do
    association :user, factory: :user
    association :information, factory: :information
  end
end
