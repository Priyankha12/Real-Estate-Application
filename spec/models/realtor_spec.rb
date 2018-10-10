require 'rails_helper'

RSpec.describe Realtor, type: :model do
  context 'validation_tests' do
    let (:company) { RealEstateCompany.create}
    it 'ensures the presence of email' do
      realtor= Realtor.new(name: "Realtor 1", password: "password", real_estate_company_id: 1).save
      expect(realtor).to eq(false)
    end

    it 'ensures the presence of password' do
      realtor= Realtor.new(name: "Realtor 1", email: "realtor1@gmail.com", real_estate_company_id: 1).save
      expect(realtor).to eq(false)
    end

    it 'ensures the presence of real estate company' do
      realtor= Realtor.new(name: "Realtor 1", email: "realtor1@gmail.com", password: "Realtor_1").save
      expect(realtor).to eq(false)
    end

   # it 'ensures successful save' do
    #  company=RealEstateCompany.create!(website: 'http://www.wilsonproperties.com')
     # realtor= Realtor.create!(name: "Realtor1", phone: "40030530", email: "realtor99979@gmail.com", password: "Realtor_1", real_estate_company_id: company.id)
     # expect(realtor).to eq(false)
    #end

  end
end
