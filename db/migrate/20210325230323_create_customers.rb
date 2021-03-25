class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :email
      t.string :phone
      t.text :notes
      t.text :address

      t.timestamps
    end
  end
end
