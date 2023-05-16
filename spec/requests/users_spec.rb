require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET /users' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
      expect(response.body).to include('index of users')
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('users/index')
    end
  end

  describe 'GET /users/:id' do
    it 'returns http success' do
      get :show, params: { id: 1 }
      expect(response).to have_http_status(:success)
      expect(response.body).to include('show user')
    end

    it 'renders the show template' do
      get :show, params: { id: 1 }
      expect(response).to render_template('users/show')
    end
  end
end
