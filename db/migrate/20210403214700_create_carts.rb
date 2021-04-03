class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.bigint :cart_id
      t.bigint :menu_id
      t.string :menu_name
      t.decimal :menu_price
      t.bigint :quantity

      t.timestamps
    end
  end
end
