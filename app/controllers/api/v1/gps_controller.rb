class Api::V1::GpsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    @waypoints = Vehicle.to_builder
    render json: @waypoints, status: 200
  end
  

  def create
    if required_params.all? {|k| gps_params.has_key? k}
      GpsJob.perform_later(gps_params)
      render json: {message: "Processing gps"}, status: 201
    else
      render json: {message: "Parameters missing" }, status: 403
    end
  end

  private

    def gps_params
      params.permit(
        :latitude,
        :longitude,
        :sent_at,
        :vehicle_identifier
      )
    end

    def required_params
      [
        :latitude,
        :longitude,
        :sent_at,
        :vehicle_identifier
      ]
    end
    
end
