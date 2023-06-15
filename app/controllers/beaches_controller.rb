require 'dotenv/load'
require 'httparty'

class BeachesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index] # (CP) removed spaces inside square brackets
  def index
    # pundit
    @beaches = policy_scope(Beach)
    search_query = params[:search_query]
    sql_subquery = "name ILIKE :search_query OR address ILIKE :search_query"
    if search_query.present?
      # Search the database for matching beaches
      @beaches = Beach.where(sql_subquery, search_query: "%#{params[:search_query]}%")

      if @beaches.present?
        # Beaches found in the database, show them in the view
        render :index
      else
        # Fetch beaches from the Google Places API
        url = 'https://maps.googleapis.com/maps/api/place/textsearch/json'
        query = {
          query: {
            query: search_query + ' beaches',
            key: ENV['GOOGLE_MAPS_API_KEY']
          }
        }

        # Send the API request
        response = HTTParty.get(url, query)
        results = response.parsed_response['results']

        if results.present?
          # Create new Beach instances and save them to the database
          @beaches = results.sample(5).map do |result|
            if result["photos"].empty?
              photo = ActionController::Base.helpers.image_url("broken-beach.jpg")
            else
              photo = result['photos'].first['photo_reference']
            end

            beach = Beach.create(
              name: result['name'],
              address: result['formatted_address'],
              photo_url: photo,
              latitude: result['geometry']['location']['lat'],
              longitude: result['geometry']['location']['lng']
            )
          end

          redirect_to beaches_path, notice: 'Beaches populated successfully'
        else
          redirect_to beaches_path, alert: 'No beaches found'
        end
      end
    else
      @beaches = Beach.all
      # markers for the map
    @markers = @beaches.geocoded.map do |beach|
      {
        lat: beach.latitude,
        lng: beach.longitude
      }
      end
    end
  end

  def show
    @beach = Beach.find_by_id(params[:id])
    @events = @beach.events
    @reviews = @beach.reviews
    # pundit
    authorize @beach
  end

  def new
    @beach = Beach.new
    # pundit
    authorize @beach
  end

  def create
    @beach = Beach.new(beach_params)
    authorize @beach
    if @beach.save
      redirect_to beach_path(@beach)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def beach_params
    params.require(:beach).permit(:name, :location, :description, :image)
  end
end
