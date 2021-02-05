# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :authenticate_user

  def create
    # finds the location to attach the review to and creates the new review then assigns the review to the logged in user and attaches a imageif the user uploaded one
    @review = Location.find_by(id: review_params[:location_id]).reviews.new(review_params)
    @review.user_id = current_user.id
    @review.image.attach(params[:file]) if review_params[:file]
    @review.save
    render json: { notice: 'Favourite was added!' }, status: 201
  end

  def destroy
    @review.destroy
    render json: { notice: 'review was deleted' }, status: 204
  end

  private

  def review_params
    params.require(:review).permit(:body, :file, :rating, :location_id)
  end
end
