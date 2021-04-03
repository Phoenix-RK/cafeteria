class Menu < ActiveRecord::Base

  def to_displayable_string
    display_status = available ? "[X]" : "[ ]"  #ternary opertor
    "#{display_status} #{menu_id} #{name} #{description} #{price} #{category_id} #{quantities}"
  end

end
