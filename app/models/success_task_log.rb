class SuccessTaskLog < ApplicationRecord
  belongs_to :task
  validates :task_id, presence: true
  validates :title, presence: true
end
