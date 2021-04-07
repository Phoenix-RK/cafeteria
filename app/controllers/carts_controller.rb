class CartsController < ApplicationController

    def index
      @sum = 0

      render "index"
    end
end
