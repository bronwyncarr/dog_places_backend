class LocationsController < ApplicationController
  before_action :authenticate_user, except: [:index]
  before_action :set_location, only: %i[show update destroy]
  before_action :owner?, only: %i[update destroy]
  def index
    @locations = Location.all.includes([:location_type,:user])
    render json: @locations.map(&:transform_json)
    
  end

  def create 
    
    @location = current_user.locations.create(params[:location])
   
    if @location.errors.any?
    
     render json: @location.errors, status: :unprocessable_entity
    else
      
       puts @location.errors.messages
      render json: @location.transform_json, status: 201
    end
  end

  def show
    
    render json: @location.transform_json
  end

  def update
    @location.update(params)
    if @location.errors.any?
      render json: @location.errors, status: :unprocessable_entity
    else
      render json: @location.transform_json, status: 201
    end
  end

  def destroy
    @location.delete

    render json: @location.transform_json, status: 204
  end

  def nearme; end

  private

  def location_params
    params.require(:location).permit(:user_id, :location_type_id, :name, :address, :description,:id, location_facilities_attributes: [:id,:name])
  end

  def set_location
    @location = Location.find(params[:id])
  rescue StandardError
    render json: { error: 'Location not found' }, status: 404
  end

  def owner?
    if current_user.id != @location.user_id
      render json: { error: 'you have no power here (this isnt yours so you cant dowhatever you just tried)' },
             status: 401
    end
  end
end
