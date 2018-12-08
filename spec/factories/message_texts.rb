FactoryBot.define do
  factory :message_text do
    association :message, factory: :message
    text { "MyString" }
  end
end
