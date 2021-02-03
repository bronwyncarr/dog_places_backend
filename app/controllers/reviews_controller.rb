# frozen_string_literal: true

class ReviewsController < ApplicationController
 before_action :authenticate_user
  

  

  def create
    @review = Location.find_by(id:review_params[:location_id]).reviews.new(review_params)
    @review.user_id = current_user.id
    @review.save
    render json: {notice: 'Favourite was added!'}, status: 201
  end

  def destroy
    @review.destroy
    render json: { notice: 'review was deleted' }, status: 204
  end

  private

 

  def review_params
    
    params.require(:review).permit(:body, :file,:rating, :location_id)
  end
end
