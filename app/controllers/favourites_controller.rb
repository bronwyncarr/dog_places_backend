class FavouritesController < ApplicationController
  before_action :authenticate_user
  before_action :set_favourite, only: :destroy
  
# here we needed to find the favourite then put all the favourite in an array so we could use the transform_json method and have a standard return
  def index
   @faves_arr = []
    @favourites = current_user.favourites.map do |fave|
      @faves_arr << favourite.find_by_id(fave.favourite_id)
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

  def set_favourite
    @favourite = Favourite.find(params[:id])
  rescue StandardError
    render json: { error: 'favourite not found' }, status: 404
  end

  def favourite_params
    params.require(:favourite).permit(:favourite_id)
  end
end