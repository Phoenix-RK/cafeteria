class Cart < ActiveRecord::Base
  def self.current
      all.where("user_id = ?",@current_user.id)
  end
end
