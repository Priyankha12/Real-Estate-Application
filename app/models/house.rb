class House < ApplicationRecord
  belongs_to :real_estate_company
  belongs_to :realtor
  has_many :inquiries
  has_one_attached :image

end
