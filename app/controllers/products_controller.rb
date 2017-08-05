class ProductsController < ApplicationController

  def index
    @products = Product.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @product_reviews = @product.reviews.order(created_at: :desc)
    
    # pass a new review object to the create review form
    @review = Review.new
  end

end
