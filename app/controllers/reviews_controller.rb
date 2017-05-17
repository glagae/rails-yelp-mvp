class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    # define the review with the user params
    @review = Review.new(review_params)
    # associate the restaurant to the review
    @review.restaurant = Restaurant.find(params[:restaurant_id])
    # save
    @review.save

    redirect_to restaurant_path(@review.restaurant)
  end

private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
