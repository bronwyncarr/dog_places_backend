# frozen_string_literal: true

class ReviewsController < ApplicationController
  # before_action :authenticate_user
  before_action :set_review, only: :destroy
  def create
    # finds the location to attach the review to and creates the new review then assigns the review to the logged in user and attaches a image if the user uploaded one

    @review = Review.new
    @review.user_id = current_user.id
    @review.image.attach(review_params[:file])
    @review.body = review_params[:body]
    @review.location_id = review_params[:location_id]
    @review.rating = review_params[:rating]
    @review.save

    if @review.errors.any?
      render json: @review.errors, status: :unprocessable_entity
    else
      render json: { notice: 'Review was added!' }, status: 201
    end
  end

  def index
    
    location = Location.find(params[:location_id])
  
    @reviews = location.reviews.map do |review|
      entries = {
        id: review.id,
        user: User.find_by_id(review.user.id).username,
        body: review.body,
        rating: review.rating
      }
      entries[:image_url] = url_for(review.image) if review.image.attached?
      entries
    end
    render json: @reviews
  end

  def destroy
    @review.destroy
    render json: { notice: 'review was deleted' }, status: 204
  end

  private

  def review_params
    params.permit(:body, :file, :rating, :location_id)
  end

  def set_review
    @review = Review.find(params[:id])
  rescue StandardError
    render json: { error: 'Review not found' }, status: 404
  end
end
