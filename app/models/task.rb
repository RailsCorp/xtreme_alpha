class Task < ApplicationRecord
  validates :title, presence: true
  validates :is_finished, inclusion: [true, false]
end
