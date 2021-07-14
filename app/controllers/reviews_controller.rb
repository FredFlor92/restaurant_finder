class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in 
    def new 
        Restaurant.find_by_id(params[":restaurant_id"]) 
        @review = @restaurant.reviews.build
    end 

    def create
        @review = current_user.reviews.build(review_params)
        if @review.save
          redirect_to review_path(@review)
        else
          render :new
        end
    end 
  
    def show 
        @review = Review.find_by_id(params[:id])   
    end 

    def index
        if @restaurant = Restaurant.find_by_id(params[:restaurant_id])
            #nested
            @reviews = @restaurant.reviews
          else
            #it's not nested
            @reviews = Review.all
          end
        end
    end 

    def review_params
        params.require(:review)permit(:restaurant_id, :content, :stars, :title)     
    end 
end
