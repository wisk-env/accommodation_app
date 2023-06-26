class Reservation < ApplicationRecord
  validates :check_in, presence: true
  validates :check_out, presence: true
  validates :number_of_guests, presence: true, numericality: true
  validate :check_in_date_cannot_be_greater_than_check_out_date

  belongs_to :user
  belongs_to :room

  private

  def check_in_date_cannot_be_greater_than_check_out_date
    if check_in.present? && check_out.present? && check_out <= check_in
      errors.add(:check_out, "はチェックイン日より後の日付で選択してください。")
    end
  end
end
