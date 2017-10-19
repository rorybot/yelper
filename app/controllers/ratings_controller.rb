class RatingsController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @rating = @restaurant.ratings.create(rating_params)
    redirect_to restaurant_path(@restaurant)
  end

  private

  def rating_params
    params.require(:rating).permit(:rater, :comment, :score)
  end

end
