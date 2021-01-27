class LocationsController < ApplicationController
  before_action :authenticate_user, except:[:index]
  before_action :set_location, only: [:show,:update,:destroy]
  before_action :is_owner?,only:[:update,:destroy]
  def index
    @locations = Location.all
    render json: @locations
  end

  def create
    @location =current_user.locations.create(location_params)
    if @location.errors.any?
      render json: @location.errors, status: :unprocessable_entity
    else
      render json: @location ,status: 201
    end
  end

  def show
    render json: @location
  end

  def update
    @location.update(location_params)
    if @location.errors.any?
      render json: @location.errors, status: :unprocessable_entity
    else
      render json: @location ,status: 201
    end
  end

  def destroy
    @location.delete
  
      render json: @location ,status: 204
    
  end

  def nearme
  end

  private

  def location_params
    params.require(:location).permit(:user_id,:location_type_id,:name,:address,:rating,)
  end

  def set_location
    begin
      @location = Location.find(params[:id])
    rescue 
      render json: {error: "Location not found"}, status: 404
    end
  end
  def is_owner?
  if current_user.id != @location.id
    render json:{error: 'you have no power here (this isnt yours so you cant dowhatever you just tried)'},status: 401 
  end
  end
end