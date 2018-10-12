class ReviewsController < ApplicationController

  before_filter :authorize

  def create
    @review = Review.new(review_params)
    @product = Product.find params[:product_id]
    @review.product_id = @product.id
    @review.user = current_user

    if @review.save
      redirect_to :back, notice: 'Review created!'
    else 
      redirect_to :back
    end
  end
  
  def destroy
    @review = Review.find params[:id]
    
    if @review.destroy
      redirect_to :back, notice: 'Review deleted!'
    else 
      redirect_to :back
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :description)
  end
end
