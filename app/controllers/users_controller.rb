class UsersController < ApplicationController
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

    redirect_to "/"
  end
end
