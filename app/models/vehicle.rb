class Vehicle < ApplicationRecord
    has_many :owners
    has_many :accident_reports
    has_many :service_records
  
    validates :vin, presence: true, uniqueness: true
    validates :make, :model, :year, presence: true
end