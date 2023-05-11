class Reservation < ApplicationRecord
  validates :check_in, presence: true
  validates :check_out, presence: true
  validates :number_of_guests, presence: true, numericality: true

  belongs_to :user
  belongs_to :room
end
