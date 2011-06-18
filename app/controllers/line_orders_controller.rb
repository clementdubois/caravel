class LineOrdersController < ApplicationController
  
  def show
    @line_order = LineOrder.find(params[:id])
    
  end
  
end
