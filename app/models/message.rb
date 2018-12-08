class Message < ApplicationRecord
  belongs_to :user
  belongs_to :team
  has_one :message_text, dependent: :destroy
  enum message_type: %i[text image file]
  validates :user_id, presence: true
  validates :team_id, presence: true
  validates :message_type, presence: true
end
