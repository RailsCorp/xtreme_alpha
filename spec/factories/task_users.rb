FactoryBot.define do
  factory :task_user do
    association :user, factory: :user
    association :task, factory: :task
  end
end
