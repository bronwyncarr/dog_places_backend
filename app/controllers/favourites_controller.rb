class FavouritesController < ApplicationController
  before_action :authenticate_user
  before_action :set_favourite, only: :destroy
  
# here we needed to find the favourite then put all the favourite in an array so we could use the transform_json method and have a standard return
  def index
    
   @faves_arr = []
    @favourites = current_user.favourites.map do |fave|
      @faves_arr << Location.find_by_id(fave.location_id)
    end
  
    render json: @faves_arr.map(&:transform_json), status: 201
  end

  def create
    @favourite = current_user.favourites.new(favourite_params)
    @favourite.user_id = current_user.id
    @favourite.save
    if @favourite.errors.any?
      render json: @favourite.errors, status: :unprocessable_entity
    end
  end

  def destroy
    current_user.favourites.find_by_location_id(favourite_params[:location_id]).destroy

    render json: { notice: 'favourite was deleted' }, status: 204
  end

  private

  def set_favourite
    # Something is not right here I suspect :(
    @favourite = current_user.favourites.find_by_location_id(favourite_params[:location_id])
  rescue StandardError
    render json: { error: 'favourite not found' }, status: 404
  end

  def favourite_params
    params.require(:favourite).permit(:favourite_id, :location_id)
  end
end