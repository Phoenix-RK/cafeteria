class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in
  def index
    render "index"
  end
  def new
    render "users/new"
  end

  def create
    User.create!(
      name: params[:name],
      email: params[:email],
      address: params[:address],
      phone: params[:phone],
      password: params[:password],
    )

    render "users/confirm"
  end
end
