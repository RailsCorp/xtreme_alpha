FactoryBot.define do
  factory :success_task_log do
    association :task, factory: :task
    title { "test_title" }
    created_at { Faker::Time.between(5.days.ago, 3.days.ago, :all) }
    updated_at { Faker::Time.between(2.days.ago, 1.days.ago, :all) }
  end
end
