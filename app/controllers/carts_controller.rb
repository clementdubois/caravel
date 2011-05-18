class CartsController < ApplicationController
  def index
    @carts = Cart.all
  end
  
  def show
    @cart = Cart.find(params[:id])
  end
  
  def new
    @cart = Cart.new
  end
  
  def create
    @cart = Cart.new(params[:cart])
    if @cart.save
      flash[:notice] = "Successfully created cart."
      redirect_to @cart
    else
      render :action => 'new'
    end
  end
  
  def edit
    @cart = Cart.find(params[:id])
  end
  
  def update
    @cart = Cart.find(params[:id])
    if @cart.update_attributes(params[:cart])
      flash[:notice] = "Successfully updated cart."
      redirect_to @cart
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    flash[:notice] = "Successfully destroyed cart."
    redirect_to carts_url
  end
end
