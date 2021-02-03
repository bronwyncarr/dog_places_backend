# frozen_string_literal: true

class LocationsController < ApplicationController
  before_action :authenticate_user, except: [:index,:get_static_assests]
  before_action :set_location, only: %i[show update destroy]
  def index
    @locations = Location.all.includes(%i[location_type  reviews])
    render json: @locations.map(&:transform_json)
  end

  def create
    
    @location = Location.new(location_params)
    
    @location.location_type = LocationType.find_by_name(params[:location_type_name])
    @location.save

    if @location.errors.any?
      render json: @location.errors, status: :unprocessable_entity
    else
      params[:location_facilities_attributes].each do |facility|
        LocationFacility.create(location_id:@location.id,facility:Facility.find_by_name(facility))
      end
      render json: @location.transform_json, status: 201
    end
  end

  def show
    render json: @location.transform_json
  end

  def update
    
    if current_user.is_admin
    @location.update(location_params)
    end
      if @location.errors.any?
        render json: @location.errors, status: :unprocessable_entity
      else
        render json: @location.transform_json, status: 201
        LocationNotifierMailer.change_location_mailer(current_user, @location).deliver
        render json: {notice:'Location changes have been sent to the admin for approval, they should be in touch soon.'}
      end
  end

  

  def destroy
    
    if current_user.is_admin
    @location.destroy
    render json: @location.transform_json, status: 204
    else
      
      LocationNotifierMailer.delete_location_mailer(current_user,@location,location_params[:description]).deliver
      render json: {notice:'Location changes have been sent to the admin for approval, they should be in touch soon.'}
    end
  end

  def nearme; end

  def favourite
    type = params[:favourite]
    case type
    when 'like'
      current_user.favourites.create(location: @location)
      render json: { notice: 'Location added to favorites!' }, status: 200
    when 'unlike'
      current_user.favourites.delete_by(location: @location)
      render json: { notice: 'Location was removed from favorites' }, status: 201
    end
  end

  def get_static_assests
    types = LocationType.all
    facilities = Facility.all
    type_array = []
    facility_array = []
      types.each do |type|
        type_array <<type.name
      end
      facilities.each do |facility|
       facility_array << facility.name
      end
      
    render json:{location_types:type_array,location_facilities:facility_array}
    end

  private

  def location_params
    params.require(:location).permit(:location_type_name, :name, :address, :description,:location_type_id,:is_admin,
                                     location_facilities_attributes: [:name])
  end

  def set_location
    @location = Location.find(params[:id])
  rescue StandardError
    render json: { error: 'Location not found' }, status: 404
  end

  
  
end
