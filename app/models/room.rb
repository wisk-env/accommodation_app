class Room < ApplicationRecord
  validates :room_name, presence: true
  validates :room_info, presence: true
  validates :fee, presence: true, numericality: true
  validates :address, presence: true
  
  belongs_to :user
  has_many :reservations, dependent: :destroy

  mount_uploader :room_image, RoomImageUploader
end
