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
class Waypoint < ApplicationRecord
  belongs_to :vehicle

  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :sent_at, presence: true
end
