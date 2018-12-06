class TaskGroup < ApplicationRecord
  belongs_to :task
  belongs_to :group
  validates :task_id, presence: true
  validates :group_id, presence: true
end
