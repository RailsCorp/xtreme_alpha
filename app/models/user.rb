# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :tasks, dependent: :destroy
  has_one :user_information, dependent: :destroy

  validates :provider, presence: true
  validates :uid, presence: true
  validates :password, presence: true, length: { minimum: 6 }, confirmation: true
  validates :email, presence: true, uniqueness: true, format: { with: Constants::VALID_EMAIL_REGEX }
  validates :sign_in_count, presence: true, numericality: { only_integer: true }
  validates :allow_password_change, inclusion: { in: [true, false] }
  validates :reset_password_token, uniqueness: true
end
