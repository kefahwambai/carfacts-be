class OwnerSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :vehicle
end
