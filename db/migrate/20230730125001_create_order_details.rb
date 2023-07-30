class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :order_id, null: false
      t.integer :item_id, null: false
      t.integer :product_status, null: false, default: 0
      t.integer :price_tax_in, null: false
      t.integer :amount, null: false

      t.timestamps
    end
  end
end
