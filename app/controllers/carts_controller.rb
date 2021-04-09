class CartsController < ApplicationController

  def index
    @sum = 0
    render "index"
  end

  def show
    render "index"
  end
  def update
    if params[:inc]
      id = params[:id]
      cart = Cart.find_by(menu_id: id, user_id: @current_user.id)
      menu = Menu.find(id)
      if menu.quantities > 0
        cart.quantity = cart.quantity + 1
        menu.quantities = menu.quantities - 1
        cart.save!
        menu.save!
      end
      redirect_to cart_path
    elsif params[:dec]
      id = params[:id]
      cart = Cart.find_by(menu_id: id, user_id: @current_user.id)
      menu = Menu.find(id)
      if cart.quantity > 0
        cart.quantity = cart.quantity - 1
        menu.quantities = menu.quantities + 1
        cart.save!
        menu.save!
      end
      if cart.quantity == 0
        cart.delete
      end
      redirect_to cart_path
    end
  end
end
