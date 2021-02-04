class FavouritesController < ApplicationController
  before_action :authenticate_user
  
# here we needed to find the location then put all the location in an array so we could use the transform_json method and have a standard return
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
  end

  def destroy
    @favourite.destroy

    render json: { notice: 'favourite was deleted' }, status: 204
  end

  private

  

  def favourite_params
    params.require(:favourite).permit(:location_id)
  end
end