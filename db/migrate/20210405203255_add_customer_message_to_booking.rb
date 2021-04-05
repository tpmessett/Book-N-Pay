class AddCustomerMessageToBooking < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :customer_message, :text
  end
end
