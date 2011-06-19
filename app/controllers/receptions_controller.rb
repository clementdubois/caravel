class ReceptionsController < ApplicationController
  def index
  end

  def new
    @reception = Reception.new
  end
  
  def new_admission
    @order = current_user.filiale.orders.validated.find_by_id(params[:reference])
    
    if @order.nil?
      redirect_to new_reception_path, :notice => "La commande #{params[:reference]} n'existe pas"
    else
      @reception = @order.receptions.new
    
      @order.line_orders.each do |lo|
        @reception.line_receptions.build({:line_order_id => lo.id, :reference_id => lo.reference_id})
      end
    end
  end
  
  def create
    @reception = Reception.create(params[:reception])
    flash[:notice] = "La réception a bien été enregistrée"
    
    render :action => :new
  end

  def show
  end

  def edit
  end
  
  def update
    
  end

end
