class MenusController < ApplicationController
  def index
    #render plain: Menu.all.map {|menu| menu.to_displayable_string}.join("\n")
    render "index"
  end

  def update
    id = params[:id]
    menu = Menu.find(id)
    cart_item = Cart.find_by(menu_id: menu.id)
    if cart_item == nil
      new_cart_item = Cart.create!(cart_id: 1, menu_id: menu.id, menu_name: menu.name, menu_price: menu.price, quantity: 1 )
    else
      cart_item.quantity = cart_item.quantity + 1
      cart_item.save!
    end
    if menu.quantities == 1
      menu.quantities = menu.quantities-1
      menu.available = false
    elsif menu.quantities > 1
      menu.quantities = menu.quantities-1
    end
    menu.save!
    redirect_to menus_path
  end
end
