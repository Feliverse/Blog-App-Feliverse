require 'rails_helper'

RSpec.describe Users::PostsController, type: :controller do
  describe 'GET /users/:user_id/posts' do
    it 'returns http success' do
      get :index, params: { user_id: 1 }
      expect(response).to have_http_status(:success)
      expect(response.body).to include('index of posts')
    end

    it 'renders the index template' do
      get :index, params: { user_id: 1 }
      expect(response).to render_template('users/posts/index')
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    it 'returns http success' do
      get :show, params: { user_id: 1, id: 1 }
      expect(response).to have_http_status(:success)
      expect(response.body).to include('show post')
    end

    it 'renders the show template' do
      get :show, params: { user_id: 1, id: 1 }
      expect(response).to render_template('users/posts/show')
    end
  end
end
