FactoryBot.define do
  factory :task do
    title { "test_title" }
    content { "testです" }
    is_finished { false }
    deadline { Faker::Time.between(5.days.ago, 3.days.ago, :all) }
    created_at { Faker::Time.between(5.days.ago, 3.days.ago, :all) }
    updated_at { Faker::Time.between(2.days.ago, 1.days.ago, :all) }
  end
end
