require 'rails_helper'

describe Api::V1::PhotosController do

  let(:user) { create(:user) }
  let(:photo) { create(:photo) }

  before :each do
    api_authorization_header(user.auth_token)
  end

  describe "PATCH #update" do
    describe 'with valid fields' do
      it 'should update a photo' do
        patch :update, params: { id: photo.id, photo: { asset_url: "Howdy"} }
        expect(json_response['photo']['asset_url']).to eq("Howdy")
      end
    end
  end
end
