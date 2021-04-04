class OrdersController < ApplicationController

  def index
    render plain: "Order placed"
  end
end
