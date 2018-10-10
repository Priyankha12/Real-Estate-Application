class RealEstateCompany < ApplicationRecord
  has_many :realtors, dependent: :destroy
  has_many :houses, dependent: :destroy
  validates :website , format: { with: /\A((http|https):\/\/)?(\w)+(\.(\w)+)(\.(\w)+)?\z/, message: "Invalid website" }
end

