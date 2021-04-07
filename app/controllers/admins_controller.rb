class AdminsController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    render "maintain"
  end

  def olditem
    render "olditem"
  end
  def newitem
    render "newitem"
  end
end
