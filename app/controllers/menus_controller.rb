class MenusController < ApplicationController
  #skip_before_action :ensure_user_logged_in
  def index
    #render plain: Menu.all.map {|menu| menu.to_displayable_string}.join("\n")
    render "index"
  end


  def create
    menu = Menu.create!(
      name: params[:name],
      description: params[:description],
      price: params[:price],
      category_id: params[:category],
      quantities: params[:quantities],
      available: true,
    )
    menu.menu_id = menu.id
    menu.save!
    flash[:notice] = "#{menu.name}  added successfully"
    redirect_to new_items_path
  end

  def update
    if params[:inc]
      id = params[:id]
      menu = Menu.find(id)
      menu.quantities = menu.quantities + 1
      menu.save!
      redirect_to old_items_path
    elsif params[:dec]
      id = params[:id]
      menu = Menu.find(id)
      if menu.quantities == 1
        menu.available = false
        menu.quantities = menu.quantities - 1
      elsif menu.quantities > 1
        menu.quantities = menu.quantities-1
      end
      menu.save!
      if menu.quantities == 0
        menu.delete
      end
      redirect_to old_items_path
    else
      id = params[:id]
      menu = Menu.find(id)
      cart_item = Cart.find_by(menu_id: menu.id)
      if cart_item == nil
        new_cart_item = Cart.create!(cart_id: 1, menu_id: menu.id, menu_name: menu.name, menu_price: menu.price, quantity: 1, user_id: @current_user.id )
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
      if menu.quantities == 0
        menu.delete
      end

      redirect_to menus_path
    end
  end
end
