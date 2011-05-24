class StoresController < ApplicationController
  def index
    @references = Reference.all
    @cart = current_cart
  end
end
