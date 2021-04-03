class ChangeCategoryInMenu < ActiveRecord::Migration[6.1]
  def change
    change_column :menus, :category_id, :string
  end
end
