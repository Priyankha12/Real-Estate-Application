class Realtor < ApplicationRecord
#belongs_to :real_estate_company, :foreign_key => :real_estate_company_id
 belongs_to :real_estate_company
has_many :houses
#accepts_nested_attributes_for :real_estate_company #, :pages
  validates :email , uniqueness: true , format: { with: /\A[\w.]+@[\w]+\.[\w]+\z/, message: "Invalid Email address"}
end

