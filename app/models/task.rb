class Task < ApplicationRecord
  has_many :success_task_logs, dependent: :destroy
  validates :title, presence: true
  validates :is_finished, inclusion: [true, false]
end
