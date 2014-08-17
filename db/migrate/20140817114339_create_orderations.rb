class CreateOrderations < ActiveRecord::Migration
  def change
    create_table :orderations do |t|
      t.integer :order_id
      t.integer :product_id

      t.timestamps
    end
  end
end
