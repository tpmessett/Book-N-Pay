class RemoveCustomerMessageFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :customer_message, :string
  end
end
