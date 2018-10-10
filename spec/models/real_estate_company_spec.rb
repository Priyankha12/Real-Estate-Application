require 'rails_helper'

RSpec.describe RealEstateCompany, type: :model do
  context 'validation tests' do
    it 'ensures the website is invalid' do
      real_estate_company = RealEstateCompany.new(website: "https://www.google.com.").save
      expect(real_estate_company).to eq(false)
    end
  end

  it 'checks that website is valid and saves real_estate_company' do
    real_estate_company = RealEstateCompany.new(website: "https://www.google.com").save
    expect(real_estate_company).to eq(true)
  end

end
