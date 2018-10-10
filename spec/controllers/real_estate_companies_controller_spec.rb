require 'rails_helper'

RSpec.describe RealEstateCompaniesController, type: :controller do
context 'GET #index' do
  it 'returns a success response' do
    get :index
    expect(response).to be_success
  end
end
  context 'GET #show' do
    it 'returns a success response' do
      company=RealEstateCompany.create!(website: 'https://www.google.com')
      get :show, params: { id: company.to_param}
      expect(response).to be_success

    end
  end
end
