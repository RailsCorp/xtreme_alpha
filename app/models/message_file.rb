class MessageFile < ApplicationRecord
  belongs_to :message
  has_one_attached :file
  validates :message_id, presence: true
end
