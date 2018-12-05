class Information < ApplicationRecord
  enum info_type: %i[personal groups]

  has_one :info_user, dependent: :destroy
  has_one :user, through: :info_user
  has_one :info_group, dependent: :destroy
  has_one :group, through: :info_group

  validates :info_type, presence: true
end
