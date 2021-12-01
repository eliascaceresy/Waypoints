# == Schema Information
#
# Table name: vehicles
#
#  id         :bigint           not null, primary key
#  identifier :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  describe "Associations" do
    it "should have many waypoints" do
      should have_many(:waypoints)
    end
  end

  describe "Validations" do
    it "should validate presence of identifier" do
      should validate_presence_of(:identifier)
    end
  end
end
