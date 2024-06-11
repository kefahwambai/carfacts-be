class AccidentReportSerializer < ActiveModel::Serializer
  attributes :id, :description, :date
  has_one :vehicle
end
