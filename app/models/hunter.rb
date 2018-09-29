class Hunter < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :inquiries, dependent: :destroy
  validates :email , uniqueness: true, format: { with: /\A[\w.]+@[\w]+\.[\w]+\z/, message: "Invalid Email address"}

  validates :contact_method, inclusion: {in: %w{email text phone}, message: "%{value} is not a valid method of contact"}

end
