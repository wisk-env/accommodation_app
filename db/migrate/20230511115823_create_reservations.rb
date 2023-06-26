class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.date :check_in
      t.date :check_out
      t.integer :number_of_guests
      t.integer :room_id
      t.integer :user_id

      t.timestamps
    end
  end
end
