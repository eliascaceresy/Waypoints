# == Schema Information
#
# Table name: vehicles
#
#  id         :bigint           not null, primary key
#  identifier :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Vehicle < ApplicationRecord
  has_many :waypoints

  validates :identifier, presence: true

  def self.to_builder
    self.all.map{|v|
    {
      id: v.id,
      identifier: v.identifier,
      gps: {
        lat: v.waypoints.last.latitude,
        long: v.waypoints.last.longitude
      }
    }
  }
  end
  
end
