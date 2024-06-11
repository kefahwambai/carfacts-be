class AccidentReport < ApplicationRecord
  belongs_to :vehicle

  validates :description, :date, presence: true
end
