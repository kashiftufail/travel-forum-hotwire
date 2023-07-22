class LineItemsController < ApplicationController
  
  def create        
    if params[:line_item].present?
      chosen_product = Product.find(params[:line_item][:product_id])
      quantity = params[:line_item][:quantity].to_i
    else  
      chosen_product = Product.find(params[:product_id])
    end  
    # Find associated product and current cart
   
    current_cart = @current_cart
  
    # If cart already has this product then find the relevant line_item and iterate quantity otherwise create a new line_item for this product
    if current_cart.products.include?(chosen_product)
      # Find the line_item with the chosen_product
      @line_item = current_cart.line_items.find_by(product_id: chosen_product)
      # Iterate the line_item's quantity by one
      @line_item.quantity += quantity if params[:line_item].present?
      @line_item.quantity += 1 if params[:line_item].blank?
    else
      @line_item = LineItem.new
      @line_item.cart = current_cart
      @line_item.product = chosen_product
      @line_item.quantity += quantity if params[:line_item].present?
      @line_item.quantity = 1 if params[:line_item].blank?         
    end
  
    # Save and redirect to cart show path
    respond_to do |format|            
      if @line_item.save        
        format.html { redirect_to product_path(chosen_product), 
                    alert: "Product added to Cart" } if params[:line_item].present?
        format.turbo_stream if params[:line_item].blank?
      else        
        format.html { redirect_to products_path, alert: @line_item.errors.full_messages }
      end
    end  
  end

  def destroy    
    line_item = LineItem.find(params[:id])            
    cart_with_line_items    
    @cart.line_items.delete(line_item) if @cart.line_items.include? line_item    
      
    respond_to do |format|  
      format.turbo_stream
    end      
  end  
  
  private
  def line_item_params
    params.require(:line_item).permit(:quantity,:product_id, :cart_id)
  end
end
