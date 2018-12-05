class Group < ApplicationRecord
  enum group_type: %i[students companies]
  # enum group_type: { students: 0, companies: 1 }

  has_many :members, dependent: :destroy
  has_many :users, through: :members
  has_one_attached :image

  validates :name, presence: true
  # validates :group_type, presence: true, numericality: true
end
