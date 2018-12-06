class Task < ApplicationRecord
  has_many :success_task_logs, dependent: :destroy
  has_many :task_users, dependent: :destroy
  has_many :users, through: :task_users
  has_many :task_groups, dependent: :destroy
  has_many :groups, through: :task_groups

  validates :title, presence: true
  validates :is_finished, inclusion: [true, false]
end
