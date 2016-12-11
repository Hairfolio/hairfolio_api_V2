require 'rails_helper'

describe Api::V1::TagsController do

  let(:tag) { create(:tag) }

  before :each do
    tag.reload
  end

  describe "GET #index" do
    it 'should display available tags' do
      get :index
      puts response.body
      expect(json_response['tags'].count).to eq(1)
    end

    it 'should filter by tag by query' do
      get :index, params: { q: tag.name }
      expect(json_response['tags'].count).to eq(1)
    end
  end

  describe "GET #show" do
    it 'should display tag information' do
      get :show, params: { id: tag.id }
      expect(json_response['tag']['name']).to eq(tag.name)
    end
  end


  describe "POST #create" do
    describe 'with valid fields' do
      it 'should display tag information' do
        post :create, params: { tag: { name: "tajfklsjfd", url: "http://www.google.com"} }
        expect(json_response['tag']['name']).to eq("tajfklsjfd")
      end
    end

    describe 'with invalid fields' do
      it 'shoudl not reate the tag' do
        post :create, params: { tag: { name: "", url: "http://www.google.com"} }
        expect(json_response['errors']['name']).to include("can't be blank")
      end
    end
  end
end
