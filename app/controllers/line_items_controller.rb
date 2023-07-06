class LineItemsController < ApplicationController

  def create  
    # Find associated product and current cart
    chosen_product = Product.find(params[:product_id])
    current_cart = @current_cart
  
    # If cart already has this product then find the relevant line_item and iterate quantity otherwise create a new line_item for this product
    if current_cart.products.include?(chosen_product)
      # Find the line_item with the chosen_product
      @line_item = current_cart.line_items.find_by(product_id: chosen_product)
      # Iterate the line_item's quantity by one
      @line_item.quantity += 1
    else
      @line_item = LineItem.new
      @line_item.cart = current_cart
      @line_item.product = chosen_product
      @line_item.quantity = 1      
    end
  
    # Save and redirect to cart show path
    respond_to do |format|            
      if @line_item.save        
        format.turbo_stream
      else        
        format.html { redirect_to products_path, alert: @line_item.errors.full_messages }
      end
    end  
  end
  
  private
  def line_item_params
    params.require(:line_item).permit(:quantity,:product_id, :cart_id)
  end
end
