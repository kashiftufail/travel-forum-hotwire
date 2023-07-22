class CartsController < ApplicationController
  def show       
    cart_with_line_items    
  end

  def update_cart        
    params[:line_item][:id].each_with_index do |item, index| 
      item = LineItem.find_by(id: params[:line_item][:id][index])
      item.update(quantity: params[:line_item][:quantity][index]) if item.present?
    end    
  
    cart_with_line_items
    respond_to do |format|   
      format.turbo_stream
    end  
  end  

  def empty_cart    
    @current_cart.line_items.delete_all    
    redirect_to cart_path, alert: 'Cart is empty.'   
  end  

  def destroy
    @cart = @current_cart
    @cart.destroy
    session[:cart_id] = nil
    redirect_to root_path
  end

  
end