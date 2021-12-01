# == Schema Information
#
# Table name: vehicles
#
#  id         :bigint           not null, primary key
#  identifier :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :vehicle do
    identifier { FFaker::Vehicle.vin }
  end
end
