class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:room_name, :room_info, :fee, :address, :user_id))
    if @room.save
      flash[:notice] = "施設が作成されました"
      redirect_to :rooms
    else
      render "new"
    end
  end
end
