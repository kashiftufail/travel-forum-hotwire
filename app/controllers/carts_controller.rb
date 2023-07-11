class CartsController < ApplicationController
  def show   
    @line_item = LineItem.new
    @cart = @current_cart
    @sub_total = @cart.sub_total
    @line_items = @cart.line_items 
  end

  def update_cart
  
  end  

  def destroy
    @cart = @current_cart
    @cart.destroy
    session[:cart_id] = nil
    redirect_to root_path
  end
end