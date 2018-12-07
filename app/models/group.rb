class Group < ApplicationRecord
  enum group_type: %i[students companies]

  has_many :members, dependent: :destroy
  has_many :users, through: :members
  has_many :task_groups, dependent: :destroy
  has_many :tasks, through: :task_groups
  has_many :teams, dependent: :destroy

  has_one :info_group, dependent: :destroy
  has_one :information, through: :info_group
  has_one_attached :image

  validates :name, presence: true
  validates :group_type, presence: true
end
