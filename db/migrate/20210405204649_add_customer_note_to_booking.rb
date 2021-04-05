class AddCustomerNoteToBooking < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :customer_note, :text
  end
end
