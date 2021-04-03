class MenusController < ApplicationController
  def index
    #render plain: Menu.all.map {|menu| menu.to_displayable_string}.join("\n")
    render "index"
  end

  def update
    id = params[:id]
    menu = Menu.find(id)
    if menu.quantities == 1
      cart
      menu.quantities = menu.quantities-1
      menu.available = false
    elsif menu.quantities > 1
      menu.quantities = menu.quantities-1
    end

    menu.save!
    redirect_to menus_path

  end
end
