class Menu < ActiveRecord::Base

  def self.juice
    all.where( category_id: 'juice')
  end

  def self.starters
    all.where(category_id: 'starters')
  end

  def self.dessert
    all.where( category_id: 'dessert')
  end

  def to_displayable_string
    display_status = available ? "[X]" : "[ ]"  #ternary opertor
    "#{display_status} #{menu_id} #{name} #{description} #{price} #{category_id} #{quantities}"
  end

end
