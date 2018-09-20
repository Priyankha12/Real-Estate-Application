class House < ApplicationRecord
  belongs_to :real_estate_company
  belongs_to :realtor
  has_many :inquiries


end
