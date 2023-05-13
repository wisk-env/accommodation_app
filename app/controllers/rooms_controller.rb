class RoomsController < ApplicationController
  before_action :set_q, only: [:index, :search, :show, :top]

  def index
    @rooms = current_user.rooms
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:room_name, :room_info, :fee, :address, :user_id, :room_image))
    if @room.save
      flash[:notice] = "施設が作成されました"
      redirect_to room_path(@room)
    else
      render "new"
    end
  end

  def top
  end

  def search
    @results = @q.result
    @q = Room.ransack
  end

  private

  def set_q
    @q = Room.ransack(params[:q])
  end
end
