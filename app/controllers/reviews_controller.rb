class ReviewsController < ApplicationController
  before_filter :authorize

  def create
    @review = current_user.reviews.new(review_params)
    @review.product_id = params[:product_id]

    if @review.save
      flash[:notice] = "Your review was created successfully"
    else
      flash[:alert] = "There was an error getting your product review"
    end
    
    redirect_to product_path(@review.product_id)
  end

  def destroy
    Review.find_by(id: params[:id]).destroy
    redirect_to product_path(params[:product_id])
  end

  private #==#==#==#==#==#==#==#==#==#==#==#==#==#==#==

  def review_params
    params.require(:review).permit(:description, :rating)
  end

end