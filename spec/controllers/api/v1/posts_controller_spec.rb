require 'rails_helper'

describe Api::V1::PostsController do

  let(:user) { create(:user) }
  let(:postable) { create(:post) }
  let(:service) { create(:service) }
  let(:color) { create(:color) }

  before :each do
    api_authorization_header(user.auth_token)
  end

  describe "GET #index" do
    it 'should render the latest posts' do
      postable.reload
      get :index
      expect(json_response['posts'].count).to eq(1)
    end

    it 'should filter the popular posts' do
      create(:like, post: postable)
      get :index, params: { popular: true }
      expect(json_response['posts'].count).to eq(1)
    end

  end

  describe "POST #create" do
    describe 'with valid fields' do
      it 'should create the post' do
        post_params = build(:post).attributes
        treatment_attributes = build(:treatment, color: color).attributes
        post_params['formulas_attributes'] = build(:formula, service: service).attributes
        post_params['formulas_attributes']['treatments_attributes'] = treatment_attributes
        post :create, params: { post: post_params }
        expect(json_response['post']['description']).to eq(post_params['description'])
        expect(json_response['post']['formulas'].count).to eq(1)
        expect(json_response['post']['formulas'].first['treatments'].count).to eq(1)
      end
    end

    describe 'with invalid fields' do
      it 'should render errors' do
        post :create, params: { post: { description: ""} }
        expect(json_response['errors']['description']).to include("can't be blank")
      end
    end
  end

  describe "PATCH #update" do
    describe 'with valid fields' do
      it 'should update the post' do
        tag = create(:tag)
        patch :update, params: { id: postable.id, post: { tag_ids: [tag.id]} }
        expect(json_response['post']['tag_ids']).to eq([tag.id])
      end

      it 'should remove treatments in a formula' do
        patch :update, params: { id: postable.id, post: { formulas_attributes: [{id: postable.formulas.first.id, treatments_attributes: [{ _destroy: true, id: postable.formulas.first.treatments.first.id}]}]}}
        expect(json_response['post']['formulas'].first['treatments'].count).to eq(0)
      end

      it 'should remove formulas' do
        patch :update, params: { id: postable.id, post: { formulas_attributes: [{id: postable.formulas.first.id, _destroy: true }]}}
        expect(json_response['post']['formulas'].count).to eq(0)
      end
    end

    describe 'with invalid fields' do
      it 'should render errors' do
        post :create, params: { post: { description: ""} }
        expect(json_response['errors']['description']).to include("can't be blank")
      end
    end
  end

  describe "DELETE #destroy" do
    it 'should delete the post' do
      delete :destroy, params: { id: postable.id }
      expect(response.status).to eq(204)
    end
  end
end
