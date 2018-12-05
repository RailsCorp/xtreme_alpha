class Information < ApplicationRecord
  enum info_type: %i[personal groups]
  validates :info_type, presence: true
end
