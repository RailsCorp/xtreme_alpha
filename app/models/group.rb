class Group < ApplicationRecord
  enum group_type: %i[students company]

  has_many :members, dependent: :destroy
  has_many :users, through: :members

  validates :name, presence: true
  validates :group_type, presence: true, numericality: true
end
