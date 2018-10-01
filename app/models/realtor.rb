class Realtor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
#belongs_to :real_estate_company, :foreign_key => :real_estate_company_id
 belongs_to :real_estate_company
has_many :houses
#accepts_nested_attributes_for :real_estate_company #, :pages
  validates :email , uniqueness: true
  validates :real_estate_company_id, presence: true
end

