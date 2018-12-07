FactoryBot.define do
  factory :team do
    association :group, factory: :group
    name { "test_name" }
    introduce { "test_introduce" }
  end
end
