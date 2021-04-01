class SessionsController < ApplicationController
  def new
  end

  def create
    user=User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render plain:"You are valid user"
    else
      render plain:"invalid"
    end
  end

end
