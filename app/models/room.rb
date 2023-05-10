class Room < ApplicationRecord
  validates :room_name, presence: true
  validates :room_info, presence: true
  validates :fee, presence: true, numericality: true
  validates :address, presence: true
  
end
