class StoresController < ApplicationController
  def index
    @products = Product.all
  end
end
