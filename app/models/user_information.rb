class UserInformation < ApplicationRecord
  has_one_attached :image

  belongs_to :user

  validates :phone_number, presence: true, format: { with: Constants::VALID_PHONE_REGEX }
end
