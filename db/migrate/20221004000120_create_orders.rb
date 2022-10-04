class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :seat_area, null: false
      t.string :seat_alphabet, null: false
      t.integer :seat_number, null: false
      t.string :order_number, null: false
      t.integer :shopping_cost, null: false
      t.integer :total_price, null: false
      t.integer :order_status, null: false, default: 0

      t.timestamps
    end
  end
end
