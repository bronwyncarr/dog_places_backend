class FavouritesController < ApplicationController
  before_action :authenticate_user
  

  def index
    @favourites = current_user.favourites.order(created_at: :desc)
    render json: @favourites.map(&:transform_json), status: 201
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