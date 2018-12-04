class Task < ApplicationRecord
  belongs_to :user
  has_many :success_task_logs, dependent: :destroy

  validates :title, presence: true
  validates :is_finished, inclusion: [true, false]
  validates :user_id, presence: true
end
