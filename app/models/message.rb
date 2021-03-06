class Message < ApplicationRecord
  belongs_to :user
  belongs_to :team
  has_one :message_text, dependent: :destroy
  has_one :message_file, dependent: :destroy
  has_one :message_image, dependent: :destroy

  enum message_type: %i[text image file]

  validates :user_id, presence: true
  validates :team_id, presence: true
  validates :message_type, presence: true

  # scope :with_message_text, -> { joins(:message_text) }
  # scope :with_message_image, -> { joins(:message_image) }
  # scope :with_message_file, -> { joins(:message_file) }
end
