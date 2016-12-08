require 'rails_helper'

describe Api::V1::FoliosController do

  let(:user) { create(:user) }
  let(:folio) { create(:folio, user: user)}

  before :each do
    folio.reload
    api_authorization_header(user.auth_token)
  end

  describe "GET #index" do

    it 'should display user\'s folios' do
      get :index
      expect(json_response['folios'].count).to eq(1)
    end
  end


  describe "POST #create" do
    describe 'with valid fields' do
      it 'should create a folio' do
        postable = create(:post)
        post :create, params: { folio: { name: "Folio name", post_ids: [postable.id]}}
        expect(json_response['folio']['post_ids']).to eq([postable.id])
        expect(json_response['folio']['name']).to eq("Folio name")
      end
    end

    describe 'with invalid fields' do
      it 'should not create a folio' do
        postable = create(:post)
        post :create, params: { folio: { post_ids: [postable.id]}}
        expect(json_response['errors']['name']).to include("can't be blank")
      end
    end
  end

  describe "PATCH #update" do
    describe 'with valid fields' do
      it 'should update a folio' do
        postable = create(:post)
        patch :update, params: { id: folio.id, folio: { name: "Folio new name", post_ids: [postable.id]}}
        expect(json_response['folio']['post_ids']).to eq([postable.id])
        expect(json_response['folio']['name']).to eq("Folio new name")
      end

      it 'should remove a post if removed' do
        postable = create(:post)
        patch :update, params: { id: folio.id, folio: { name: "Folio new name", post_ids: []}}
        expect(json_response['folio']['post_ids']).to eq([])
        expect(json_response['folio']['name']).to eq("Folio new name")
      end
    end

    describe 'with invalid fields' do
      it 'should not update a folio' do
        postable = create(:post)
        patch :update, params: { id: folio.id, folio: { name: "", post_ids: [postable.id]}}
        expect(json_response['errors']['name']).to include("can't be blank")
      end
    end
  end

  describe "DELETE #destroy" do

    it 'should delete a folio' do
      delete :destroy, params: { id: folio.id }
      expect(response.status).to eq(204)
    end
  end
end