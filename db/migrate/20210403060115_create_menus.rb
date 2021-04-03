class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.bigint :menu_id
      t.string :name
      t.string :description
      t.decimal :price
      t.bigint :category_id
      t.bigint :quantities
      t.boolean :available

      t.timestamps
    end
  end
end
