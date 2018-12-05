class Information < ApplicationRecord
  enum info_type: %i[personal groups]

  has_one :info_user
  has_one :user, through: :info_user

  validates :info_type, presence: true
end
