class Cart < ActiveRecord::Base
  def self.calSum(id)
    @sum=0
    @list = Cart.all.where(user_id: id)

    @list.all.each do |cart|
        @sum = @sum + (cart.quantity * cart.menu_price)
    end
    return @sum
  end
end
