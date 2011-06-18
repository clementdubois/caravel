class OrdersController < ApplicationController
  before_filter :get_stocks, :only => [:new]
  before_filter :get_order, :only => [:show, :edit]
  before_filter :cant_edit, :only => [:edit]
  respond_to :html, :xml, :json
  # GET /orders
  # GET /orders.xml
  def index
    @orders = current_user.filiale.orders.paginate :page => params[:page], :order=>'created_at desc', :per_page => 10
    @orders_grouped_by_state = @orders.group_by {|o| o.state}
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.xml
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.xml
  def new
    @order = Order.new
    Reference.count.times {@order.line_orders.build }
    
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
    @stocks = current_user.filiale.stocks.accepted & @order.receiver.stocks
  end

  # POST /orders
  # POST /orders.xml
  def create
    @orders = []
    @suppliers = []
    
    params[:order][:line_orders_attributes].reject.each do |i, lo|
      unless lo["reference_id"].blank?
        supplier = Reference.find(lo["reference_id"]).supplier  
        @suppliers << supplier unless @suppliers.include?(supplier)
      end
    end
    
    @suppliers.each do |supplier|
      Rails.logger.debug { "---------------------#{supplier.to_yaml}"}
      order = Order.new({:receiver_id => supplier.id, :receiver_type => "Supplier", :filiale_id => current_user.filiale.id})
      params["order"]["line_orders_attributes"].each do |line_number, line_params| 
        if !line_params["reference_id"].blank? && Reference.find(line_params["reference_id"]).supplier == supplier
          order.line_orders.build(line_params)
        end
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
    params[:order].merge!({:state => "envoyée"}) if params[:commit] == "Valider et envoyer"

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to(edit_order_path(@order), :notice => 'La commande à bien été mise à jour.') }
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
  
  def get_order
    @order = Order.find(params[:id])
  end
  
  def cant_edit
    if @order.validated?
      redirect_to @order, :notice => "La commande à été envoyée, vous ne pouvez plus la modifier"
    end
  end

end
