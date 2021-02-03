# frozen_string_literal: true

class ReviewsController < ApplicationController
 #before_action :authenticate_user!, except: [:index]
  # before_action :find_location!

  # def index
  #   @reviews = @location.reviews.order(created_at: :desc)
  # end

  def create
   byebug
    @review = Location.find_by(id:review_params[:location_id]).reviews.new(review_params)
    @review.user_id = current_user.id
    @review.save
  end

  def destroy
    @review.destroy

    render json: { notice: 'review was deleted' }, status: 204
  end

  private

  # def find_location!
    

  #   @review = Location.find(params[:id])
  # end

  def review_params
    
    params.require(:review).permit(:body, :file,:rating, :location_id)
  end
end
