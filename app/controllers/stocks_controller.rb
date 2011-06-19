class StocksController < ApplicationController
  before_filter :find_filiale
  respond_to :html, :xml, :json 
  
  def index
    @references_by_category = @filiale.stocks.accepted.group_by {|s| s.reference.category.name}
    
  end

  def show
    @stock = current_user.filiale.stocks.find_by_reference_id(params[:id])
    respond_with(@stock)
  end

  def edit
    @stock = current_user_filiale.stocks.find_by_reference_id(params[:id])
  end
  
  def edit_multiple
    @stocks = current_user.filiale.stocks.accepted  
  end

  def update_multiple
    @stocks = Stock.update(params[:stocks].keys, params[:stocks].values).reject { |p| p.errors.empty? }
    flash[:notice] = "Informations modifiées"
    redirect_to edit_multiple_stocks_path
  end

  def edit_bulk_validate
    @stocks = current_user.filiale.stocks.pending
  end
  
  def bulk_validate
    @stocks = Stock.find(params[:stocks].keys)
    @stocks.each do |stock|
      stock.status = "valide"
      stock.save!
    end
    flash[:notice] = "Référence(s) validées dans le stock"
    redirect_to edit_bulk_validate_stocks_path
  end
  

  def update
  end

  def new
  end

  def create
  end

  def destroy
  end

  def find_filiale
    @filiale = current_user.filiale
  end
end
