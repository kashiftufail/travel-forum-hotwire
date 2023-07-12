module LineItemsHelper
  def line_items        
    @current_cart.line_items.present? ? 
      @current_cart.line_items.map(&:quantity).sum : ""
  end  
end
