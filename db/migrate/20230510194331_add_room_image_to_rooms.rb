class AddRoomImageToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :room_image, :string
  end
end
