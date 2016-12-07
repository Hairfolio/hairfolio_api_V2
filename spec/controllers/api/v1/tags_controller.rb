require 'rails_helper'

describe Api::V1::TagsController do

  let(:tag) { create(:tag) }

  before :each do
    tag.reload
  end

  describe "GET #index" do
    it 'should display available tags' do
      get :index
      expect(json_response['tags'].count).to eq(1)
    end

    it 'should filter by tag by query' do
      get :index, params: { q: tag.name }
      expect(json_response['tags'].count).to eq(1)
    end
  end
end
