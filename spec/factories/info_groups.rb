FactoryBot.define do
  factory :info_group do
    association :group, factory: :group
    association :information, factory: :information
  end
end
