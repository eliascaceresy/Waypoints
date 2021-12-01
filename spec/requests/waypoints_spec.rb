require 'rails_helper'

RSpec.describe "Waypoints", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/"
      expect(response).to have_http_status(:success)
      expect(response).to render_template "waypoints/show"
    end
  end

end
