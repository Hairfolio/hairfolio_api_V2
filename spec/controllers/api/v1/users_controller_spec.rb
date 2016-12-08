require 'rails_helper'

describe Api::V1::UsersController do

  let(:user) { create(:user) }

  describe "GET #index" do
    it 'should display available users' do
      user.reload
      get :index
      expect(json_response['users'].count).to eq(1)
    end

    it 'should filter by account type' do
      user.reload
      get :index, params: { account_type: 'consumer' }
      expect(json_response['users'].count).to eq(1)
    end
  end

  describe "GET #show" do
    it 'should disdplay the user attributes' do
      get :show, params: { id: user.id }
      expect(json_response['user']['first_name']).to eq(user.first_name)
    end
  end

  describe "POST #create" do
    describe 'with valid fields' do
      it 'should create the user' do
        user_params = build(:user).attributes
        user_params['password'] = 'testing123'
        user_params['account_type'] = 'stylist'
        user_params['educations_attributes'] = build(:education, user: nil).attributes
        user_params['offerings_attributes'] = build(:offering, user: nil).attributes
        post :create, params: { user: user_params }
        expect(json_response['user']['first_name']).to eq(user_params['first_name'])
        expect(json_response['user']['educations'].count).to eq(1)
        expect(json_response['user']['offerings'].count).to eq(1)
      end
    end

    describe 'with invalid fields' do
      it 'not create the user' do
        user_params = build(:user).attributes
        user_params['email'] = nil
        post :create, params: { user: user_params }
        expect(json_response['errors']['email']).to include("can't be blank")
      end
    end
  end

  describe "PATCH #update" do
    describe 'with valid fields' do
      it 'should update the user' do
        patch :update, params: { id: user.id, user: { first_name: "new Name"}}
        expect(json_response['user']['first_name']).to eq('new Name')
      end

      it 'should remove an education' do
        education = create(:education, user: user)
        patch :update, params: { id: user.id, user: { educations_attributes: [{ id: education.id, _destroy: true }]}}
        user.reload
        expect(user.educations.count).to eq(0)
      end

      it 'should remove an offering' do
        offering = create(:offering, user: user)
        patch :update, params: { id: user.id, user: { offerings_attributes: [{ id: offering.id, _destroy: true }]}}
        user.reload
        expect(user.offerings.count).to eq(0)
      end

      it 'should add an offering' do
        patch :update, params: { id: user.id, user: { offerings_attributes: build(:offering, user: nil).attributes}}
        user.reload
        expect(user.offerings.count).to eq(1)
      end

    end

    describe 'with invalid fields' do
      it 'should render an error' do
        patch :update, params: { id: user.id, user: { email: ""}}
        expect(json_response['errors']['email']).to include("can't be blank")
      end
    end
  end

  describe "DELETE #destroy" do
    it 'should delete the user and the associations' do
      delete :destroy, params: { id: user.id }
      expect(response.status).to eq(204)
    end
  end
end