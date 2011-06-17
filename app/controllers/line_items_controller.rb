class LineItemsController < ApplicationController
  def index
    @line_items = LineItem.all
  end
  
  def show
    @line_item = LineItem.find(params[:id])
  end
  
  def new
    @line_item = LineItem.new
  end
  
  def create 
    @cart = current_cart 
    reference = Reference.find(params[:reference_id]) 
    @line_item = @cart.add_reference(reference.id)
    
    respond_to do |format| 
      if @line_item.save
        format.js { @current_item = @line_item }
        format.html { redirect_to(root_url) }
        format.xml { render :xml => @line_item, 
                            :status => :created, 
                            :location => @line_item }
      else
        format.html { render :action => "new" } 
        format.xml { render :xml => @line_item.errors,
          :status => :unprocessable_entity }
      end 
    end
  end
  
  def edit
    @line_item = LineItem.find(params[:id])
  end
  
  def update
    @line_item = LineItem.find(params[:id])
    if @line_item.update_attributes(params[:line_item])
      flash[:notice] = "Successfully updated line item."
      redirect_to @line_item
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    flash[:notice] = "Successfully destroyed line item."
    redirect_to line_items_url
  end
end
