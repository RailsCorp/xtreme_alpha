class MessageImage < ApplicationRecord
  belongs_to :message
  has_one_attached :image
  validates :message_id, presence: true
end
