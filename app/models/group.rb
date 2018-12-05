class Group < ApplicationRecord
  enum group_type: %i[students companies]
  # enum group_type: { students: 0, companies: 1 }

  has_many :members, dependent: :destroy
  has_many :users, through: :members
  has_one :info_group, dependent: :destroy
  has_one :information, through: :info_group
  has_one_attached :image

  validates :name, presence: true
  validates :group_type, presence: true
end
