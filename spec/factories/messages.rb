FactoryBot.define do
  factory :message do
    message_type { 0 }
    association :user, factory: :user
    association :team, factory: :team
  end
end
