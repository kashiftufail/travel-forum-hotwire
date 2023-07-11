# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[show]

  # GET /products or /products.json
  def index
    @products = Product.includes(:category)
  end

  # GET /products/1 or /products/1.json
  def show    
    @cart = Cart.new
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find_by_slug(params[:id])
  end
end
