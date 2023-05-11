class ReservationsController < ApplicationController
  before_action :set_q, only: [:confirm]

  def index
    @reservations = current_user.reservations
  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:check_in, :check_out, :number_of_guests, :user_id, :room_id))
    if @reservation
      flash[:notice] = "施設の予約が完了しました"
      redirect_to :reservations
    else
      @room = Room.find_by(params[:reservation][:room_id])
      render template: "rooms/show"
    end
  end

  def confirm
    @reservation = Reservation.new(params.require(:reservation).permit(:check_in, :check_out, :number_of_guests, :user_id, :room_id))
    if @reservation.save
      @reservation = Reservation.new(params.require(:reservation).permit(:check_in, :check_out, :number_of_guests, :user_id, :room_id))
      @total_days = (@reservation.check_out - @reservation.check_in).to_i
      @total_price = @reservation.room.fee * @reservation.number_of_guests * (@reservation.check_out - @reservation.check_in).to_i
      return
    else
      @room = Room.find(@reservation.room_id)
      render "rooms/show"
    end
  end

  private

  def set_q
    @q = Room.ransack(params[:q])
  end
end
