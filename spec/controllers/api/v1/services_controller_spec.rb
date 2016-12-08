require 'rails_helper'

describe Api::V1::ServicesController do

  let(:brand) { create(:brand) }
  let(:service) { create(:service, brand: brand) }

  before :each do
    brand.reload
    service.reload
  end

  describe "GET #index" do
    it 'should display available services' do
      get :index
      expect(json_response['services'].count).to eq(1)
    end

    it 'should filter by brand available services' do
      get :index, params: { brand_id: brand.id }
      expect(json_response['services'].count).to eq(1)
    end
  end

  describe "GET #show" do

    it 'should display the brand attributes' do
      get :show, params: { id: service.id }
      expect(json_response['service']['name']).to eq(service.name)
    end
  end
end