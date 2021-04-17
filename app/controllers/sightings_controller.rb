class SightingsController < ApplicationController
  def show
    sighting = Sighting.find_by(id: params[:id])
    if sighting
      # render json: {id: sighting.id, bird: sighting.bird, location: sighting.location}
      # using include

      render json: sighting, include: %i[bird location]
    else
      render json: { message: 'No Sighting Found With That ID' }
    end
  end 

  def index 
    sightings = Sighting.all 
    render json: sightings, include: %i[bird location], except: %i[updated_at]
  end
end
