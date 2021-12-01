require 'rails_helper'

RSpec.describe "Api::V1::Gps", type: :request do

  let(:valid_gps) {
    {
      "latitude": 20.23,
      "longitude": -0.56,
      "sent_at": "2016-06-02 20:45:00",
      "vehicle_identifier": "HA-3452"
    }
  }

  let(:invalid_gps) {}

  describe "POST #create" do
    let(:expected_response) {
      expect(response).to have_http_status 201
      expect(response.message).to eq "Created" 
    }

    context "when send a valid gps information" do
      let(:gps_params) { valid_gps }
      it "should return status 201 success" do
      end
    end
    
    context "when send an invalid gps information" do
      let(:gps_params) { invalid_gps }
      let(:expected_response) {
        expect(response).to have_http_status 403  
      }

      it "should return status 403 unprocessable_entity" do
      end
    end
  end

  after :each do
    post "/api/v1/gps", params: gps_params
    expected_response
  end

end
