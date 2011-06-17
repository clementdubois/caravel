class OrdersController < ApplicationController
  before_filter :get_stocks, :only => [:new]
  respond_to :html, :xml, :json
  # GET /orders
  # GET /orders.xml
  def index
    @orders = Order.paginate :page => params[:page], :order=>'created_at desc', :per_page => 10

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.xml
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.xml
  def new
    @order = Order.new
    5.times {@order.line_orders.build }
    
    # @cart = current_cart 
    # if @cart.line_items.empty?
    #   redirect_to root_url, :notice => "Your cart is empty"
    #   return 
    # end
    # @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.xml
  def create
    @orders = []
    @references = Reference.find(params[:references].compact.reject {|a| a.blank?})
    @suppliers = @references.group_by {|r| r.supplier}
    
    @suppliers.each do |supplier, references|
      order = Order.new({:receiver_id => supplier.id, :receiver_type => "Supplier", :filiale_id => current_user.filiale.id})
      references.each do |reference|
        order.line_orders.build({:reference_id => reference.id})
      end
      order.save
      @orders << order
    end
    
    respond_with(@orders) do |format|
      format.html {redirect_to stocks_path}
    end
    
    # @order = Order.new(params[:order])
    #     @order.add_line_items_from_cart(current_cart)
    # 
    #     respond_to do |format|
    #       if @order.save
    #         Cart.destroy(session[:cart_id]) 
    #         session[:cart_id] = nil 
    #         format.html { redirect_to(root_url, :notice => 'Thank you for your order.') }
    #         format.xml  { render :xml => @order, :status => :created, :location => @order }
    #       else
    #         format.html { render :action => "new" }
    #         format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
    #       end
    #     end
  end

  # PUT /orders/1
  # PUT /orders/1.xml
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to(@order, :notice => 'Order was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.xml
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to(orders_url) }
      format.xml  { head :ok }
    end
  end
  
  def get_stocks
    @stocks = current_user.filiale.stocks.accepted
  end

end
