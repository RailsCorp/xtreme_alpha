FactoryBot.define do
  factory :message_file do
    association :message, factory: :message
  end
end
