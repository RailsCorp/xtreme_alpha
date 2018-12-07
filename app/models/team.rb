class Team < ApplicationRecord
  belongs_to :group
  has_one_attached :image
  validates :group_id, presence: true
  validates :name, presence: true
end
