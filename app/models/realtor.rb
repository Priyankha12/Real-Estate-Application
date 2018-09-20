class Realtor < ApplicationRecord
belongs_to :real_estate_company
has_many :houses
  validates :email , uniqueness: true , format: { with: /\A[\w.]+@[\w]+\.[\w]+\z/, message: "Invalid Email address"}
end
