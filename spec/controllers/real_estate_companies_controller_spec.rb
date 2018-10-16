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

      context 'PUT #update' do
        before do
          @real_estate_company = RealEstateCompany.create(name:'abc', website:'https://www.google.com', address:'def', size:2, founded:'01-01-2018', revenue:123.00, synopsis:'ghi')
        end
        it 'updates the real estate company' do
          put :update, params: {id: @real_estate_company.id,real_estate_company: {name:'abc', website:'https://www.google.com', address:'jkl', size:2, founded:'01-01-2018', revenue:123.00, synopsis:'ghi' }}
          expect(response).to be_redirect
        end
      end

      context 'DELETE #destroy' do
        before do
          @real_estate_company = RealEstateCompany.create(name:'abc', website:'https://www.google.com', address:'def', size:2, founded:'01-01-2018', revenue:123.00, synopsis:'ghi')
        end
        it 'delete the real estate company' do
          expect{
            delete :destroy, params: {id: @real_estate_company.id, real_estate_company: {name:'abc', website:'https://www.google.com', address:'jkl', size:2, founded:'01-01-2018', revenue:123.00, synopsis:'ghi' }
            }}.to change(RealEstateCompany, :count).by(-1)
        end
      end

    end
  end
end
