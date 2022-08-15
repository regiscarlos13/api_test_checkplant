# frozen_string_literal: true

class GeopointsController < ApplicationController # :nodoc:
  def create
    distance = Geocoder::Calculations.distance_between(
      geopoint_params[:latitude],
      geopoint_params[:logintude]
    )

    render json: {
      distance: distance.round(2)
    }
  end

  private

  def geopoint_params
    params.require(:geopoint).permit(latitude: [], logintude: [])
  end
end
