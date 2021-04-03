class HomeController < ApplicationController
  def index

    render "index", locals: {user_name: current_user.name}
  end
end
