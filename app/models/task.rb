class Task < ApplicationRecord
  has_many :success_task_logs, dependent: :destroy
  has_many :task_users, dependent: :destroy
  has_many :users, through: :task_users

  validates :title, presence: true
  validates :is_finished, inclusion: [true, false]
end
