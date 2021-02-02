class FavouritesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :find_location!

  def index
    @favourites = current_user.favourites.order(created_at: :desc)
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

  def find_location!
    @favourite = Location.find(params[:location_id])
  end

  def favourite_params
    params.require(:favourite).permit(:body)
  end
end