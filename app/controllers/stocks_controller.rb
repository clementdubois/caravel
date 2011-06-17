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
