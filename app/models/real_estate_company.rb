class RealEstateCompany < ApplicationRecord
  has_many :realtors
  has_many :houses
  validates :website , format: { with: /\A(\w)+(\.(\w)+)(\.(\w)+)?\z/, message: "Invalid website" }
end

