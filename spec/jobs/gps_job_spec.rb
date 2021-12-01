require 'rails_helper'

RSpec.describe GpsJob, type: :job do

  let(:valid_gps) {
    {
      "latitude": 20.23,
      "longitude": -0.56,
      "sent_at": "2016-06-02 20:45:00",
      "vehicle_identifier": "HA-3452"
    }
  }

  describe "#perform_later" do
    it "create wayponit" do
      ActiveJob::Base.queue_adapter = :test

      expect {
        GpsJob.perform_later(valid_gps)
      }.to have_enqueued_job
    end
  end
end
