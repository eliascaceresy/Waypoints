class GpsJob < ApplicationJob
  queue_as :high_priority

  def perform(params)
    @vehicle = Vehicle.find_or_create_by(identifier: params[:vehicle_identifier])

    @vehicle.waypoints.create(
      longitude: params[:longitude],
      latitude: params[:latitude],
      sent_at: params[:sent_at]
    )
  end
end
