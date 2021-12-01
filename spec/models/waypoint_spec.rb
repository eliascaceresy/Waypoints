# == Schema Information
#
# Table name: waypoints
#
#  id         :bigint           not null, primary key
#  latitude   :float
#  longitude  :float
#  sent_at    :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  vehicle_id :bigint           not null
#
# Indexes
#
#  index_waypoints_on_vehicle_id  (vehicle_id)
#
# Foreign Keys
#
#  fk_rails_...  (vehicle_id => vehicles.id)
#
require 'rails_helper'

RSpec.describe Waypoint, type: :model do
  describe "Associations" do
    it "should belong to vehicle" do
      should belong_to(:vehicle)
    end
  end

  describe "Validations" do
    it "should validate presence of latitude" do
      should validate_presence_of(:latitude)
    end
    it "should validate presence of longitude" do
      should validate_presence_of(:longitude)
    end
    it "should validate presence of sent_at" do
      should validate_presence_of(:sent_at)
    end
  end
end
