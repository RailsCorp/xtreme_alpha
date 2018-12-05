class Group < ApplicationRecord
  enum group_type: %i[students company]
  validates :name, presence: true
  validates :group_type, presence: true, numericality: true
end
