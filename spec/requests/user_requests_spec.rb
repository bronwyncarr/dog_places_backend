# frozen_string_literal: true

RSpec.describe UsersController, type: :request do
  describe 'users requests' do
    context ' valid user' do
      before(:example) do
        @valid_user_params = FactoryBot.attributes_for(:user)
        post sign_up_path, params: { user: @valid_user_params }, headers: authenticated_header
        @json_response = JSON.parse(response.body)
      end
      it ' returns http 201 when valid' do
        expect(response).to have_http_status(201)
      end
    end
  end

  describe 'admin users requests' do
    context ' admin user' do
      before(:example) do
        @admin_user_params = FactoryBot.attributes_for(:user, :admin)
        post sign_up_path, params: { user: @admin_user_params }, headers: authenticated_header
        @json_response = JSON.parse(response.body)
      end
      it ' returns http 201 when valid' do
        expect(response).to have_http_status(201)
      end
    end
  end
  context 'invalid users' do
    before(:example) do
    end
  end
end
