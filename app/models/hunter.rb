class Hunter < ApplicationRecord
  has_many :inquiries
  validates :email , uniqueness: true, format: { with: /\A[\w.]+@[\w]+\.[\w]+\z/, message: "Invalid Email address"}

  validates :contact_method, inclusion: {in: %w{email text phone}, message: "%{value} is not a valid method of contact"}

end
