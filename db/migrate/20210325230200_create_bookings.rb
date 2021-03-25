class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.text :notes
      t.integer :price
      t.datetime :start_time
      t.datetime :end_time
      t.integer :paid

      t.timestamps
    end
  end
end
