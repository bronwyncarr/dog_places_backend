# frozen_string_literal: true

class LocationsController < ApplicationController
  before_action :authenticate_user, except: %i[index nearme get_static_assests]
  before_action :set_location, only: %i[show update destroy]
  # using the transform json method the locations are turned into a hash so that they can be checked to see if the user has favourited any of them before sending it back to React so that a icon can be rendered based on each entries boolean
  LocationReducer = Rack::Reducer.new(
    Location.all,
    ->(name:) { where('lower(name) like ?', "%#{name.downcase}%") }
    # ->(address:) { where('lower(address) like ?', "%#{address.downcase}%") },
    # -> (location_type:) { joins(:location_types).merge(LocationType.where('location_types.name ILIKE ?', "%#{location_type.capitalize}%")) }
  )

  def index
    @locations = LocationReducer.apply(params).includes(%i[location_type])
    res = @locations.map(&:transform_json)
    if current_user
      res.map do |entry|
        entry[:faved] = fave_check(entry[:id])
      end
    end

    render json: res
  end

  def create
    @location = Location.new
    @location.name = location_params[:name]
    @location.address = location_params[:address]
    @location.description = location_params[:description]

    # it was easiest to send through the location name rather than send the id and over to react and use sql to find the location based on the id because of how the react form is implimented

    @location.location_type = LocationType.find_by_name(location_params[:location_type_name])
    @location.save

    if @location.errors.any?
      render json: @location.errors, status: :unprocessable_entity
    else
      # to avoid corrupt data the location facilities arent added if there is any error on the entry
      location_params[:location_facilities_attributes].map do |facility|
        LocationFacility.create(location_id: @location.id, facility: Facility.find_by_name(facility))
      end
      render json: @location.transform_json, status: 201
    end
  end

  def show
    render json: @location.transform_json
  end

  def update
    # the users cant update or delete locations once they're posted, instead they can makea requst to the admin account and then that account can decide if the changes are legitimate

    if current_user.is_admin
      @location.update({ name: location_params[:name],
                         location_type_id: LocationType.find_by_name(location_params[:location_type_name]).id, address: location_params[:address], description: location_params[:description] })
      location_params[:location_facilities_attributes].map do |facility|
        LocationFacility.create(location_id: @location.id, facility: Facility.find_by_name(facility))
      end
    elsif @location.errors.any?
      render json: @location.errors, status: :unprocessable_entity
    else

      # the email being sent to the admin
      LocationNotifierMailer.change_location_mailer(current_user, @location).deliver
      render json: @location.transform_json, status: 201

    end
  end

  # once again only admin can delete, this was because we were thinking of having legitimate business' on here and we worried about defamation.
  def destroy
    if current_user.is_admin
      @location.destroy
      render json: @location.transform_json, status: 204
    else
      # email being sent tho the admin
      LocationNotifierMailer.delete_location_mailer(current_user, @location, params[:description]).deliver
      render json: { notice: 'Location changes have been sent to the admin for approval, they should be in touch soon.' },
             status: 201
    end
  end

  # geocoder nearby locations feature
  def nearme
    # nearby returns a location list which is then mapped through with the transform json method. if there are no entries is sends back an array
    nearby = Location.all.where.not(latitude: nil).near([location_params[:lat], location_params[:lng]],
                                                        location_params[:description], units: :km)
    render json: nearby.map(&:transform_json), status: 201
  end

  # since the transform json method turns the return into a hash here we can check the users favourites based on the out put of that method and then send it back to the react side with the favourite boolean
  def fave_check(id)
    current_user.favourites.map do |fave|
      fave.location_id == id
    end
  end

  # thisis how we load the necesarry information on the react side to create a location, the locationtype and facilities were static so this just made sense.
  def get_static_assests
    types = LocationType.all
    facilities = Facility.all
    type_array = []
    facility_array = []
    types.each do |type|
      type_array << type.name
    end
    facilities.each do |facility|
      facility_array << facility.name
    end
    render json: { location_types: type_array, location_facilities: facility_array }
  end

  private

  def location_params
    params.require(:location).permit(:location_type_name, :name, :address, :file, :description, :location_type_id,
                                     :is_admin, :id, :lat, :lng, location_facilities_attributes: [])
  end

  def set_location
    @location = Location.find(params[:id])
  rescue StandardError
    render json: { error: 'Location not found' }, status: 404
  end
end
