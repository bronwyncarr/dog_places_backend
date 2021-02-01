class LocationsController < ApplicationController
  before_action :authenticate_user, except: [:index]
  before_action :set_location, only: %i[show update destroy]
  before_action :owner?, only: %i[update destroy]
  def index
    @locations = Location.all.includes(%i[location_type user])
    render json: @locations.map(&:transform_json)
  end

  def create
   
    @location = Location.new(location_params)
    @location.user_id = current_user.id
    @location.save
    if @location.errors.any?
      byebug

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

  def favourite
    type = params[:favourite]
    if type == 'like'
      current_user.favourites.create(location: @location)
      render json: { notice: 'Location added to favorites!' }, status: 200
    elsif type == 'unlike'
      current_user.favourites.delete_by(location: @location)
      render json: { notice: 'Location was removed from favorites' }, status: 201
    end
  end

  private

  def location_params
    params.require(:location).permit( :location_type_id, :name, :address, :description,
                                     location_facilities_attributes: %i[id name])
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
