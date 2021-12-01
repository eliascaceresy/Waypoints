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
FactoryBot.define do
  factory :waypoint do
    latitude { FFaker::Geolocation.lat }
    longitude { FFaker::Geolocation.lng }
    sent_at { FFaker::Time.datetime }
    vehicle { Vehicle.last || FactoryBot.create(:vehicle) }
  end
end
