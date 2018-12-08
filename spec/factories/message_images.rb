FactoryBot.define do
  factory :message_image do
    association :message, factory: :message
  end
end
