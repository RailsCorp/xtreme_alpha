FactoryBot.define do
  factory :task_group do
    association :group, factory: :group
    association :task, factory: :task
  end
end
