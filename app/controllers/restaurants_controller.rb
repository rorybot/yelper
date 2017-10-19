require 'restaurants_helper'

class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    ratings_array = grab_ratings_for(params[:id].to_i)
    @average = ratings_array.reduce(:+).to_f / ratings_array.size
    p @average
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    # binding.pry
    if @restaurant.save
      redirect_to @restaurant
    else
      render 'new'
    end
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.update(restaurant_params)
      redirect_to @restaurant
    else
      render 'edit'
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path
  end

  def grab_ratings_for(restaurant_id)
    ratings_array = []
    Rating.all.each{ |rating| if rating.restaurant_id == restaurant_id
        ratings_array << rating.score
      end}
      return ratings_array
  end


  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :rating, :address, :description)
  end
end
