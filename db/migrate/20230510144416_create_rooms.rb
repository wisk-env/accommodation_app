class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :room_name
      t.string :room_info
      t.integer :fee
      t.string :address
      t.integer :user_id

      t.timestamps
    end
  end
end
