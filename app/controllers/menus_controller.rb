class MenusController < ApplicationController
  def index
    render plain: Menu.all.map {|menu| menu.to_displayable_string}.join("\n")
  end

end
