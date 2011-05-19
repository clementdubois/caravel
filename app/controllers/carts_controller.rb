class CartsController < ApplicationController
  def index
    @carts = Cart.all
  end
  
  def show
    begin
      @cart = Cart.find(params[:id]) 
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to store_url, :notice => 'Invalid cart'
    else
      respond_to do |format|
        format.html # show.html.erb
        format.xml { render :xml => @cart }
      end 
    end
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
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to(store_url) }
    end
  end
end
