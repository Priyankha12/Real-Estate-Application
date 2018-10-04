class House < ApplicationRecord
  belongs_to :real_estate_company
  belongs_to :realtor
  has_many :inquiries, dependent: :destroy
  has_one_attached :image, dependent: :destroy

end
