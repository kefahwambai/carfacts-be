class VehicleSerializer < ActiveModel::Serializer
  attributes :id, :vin, :make, :model, :year
end
