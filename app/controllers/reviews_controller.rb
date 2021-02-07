# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :authenticate_user

  def create
    # finds the location to attach the review to and creates the new review then assigns the review to the logged in user and attaches a imageif the user uploaded one

    @review = Review.new
    @review.user_id = current_user.id
    @review.image.attach(review_params[:file])
    @review.body = review_params[:body]
    @review.location_id = review_params[:location_id]
    @review.rating = review_params[:rating]
    @review.save
    
    # if @review.errors.any?
    render json: { notice: 'Favourite was added!' }, status: 201
  end

  def destroy
    @review.destroy
    render json: { notice: 'review was deleted' }, status: 204
  end

  private

  def review_params
    params.permit(:body, :file, :rating, :location_id)
  end
end
