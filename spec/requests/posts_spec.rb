require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    let(:user) { FactoryBot.create(:user) }

    before do
      get user_posts_path(user)
    end

    it 'Should return successful response' do
      expect(response).to have_http_status(:success)
    end

    it 'Should render the index template' do
      expect(response).to render_template(:index)
    end

    it 'Should include Default text on template' do
      expect(response.body).to include('List of posts here')
    end
  end

  describe 'GET #show' do
    let(:post) { FactoryBot.create(:post) }
    let(:user) { post.author }
    before do
      get user_post_path(user_id: user.id, id: post.id)
    end
    it 'Should return successful response' do
      expect(response).to have_http_status(:success)
    end

    it 'Should render the show template' do
      expect(response).to render_template(:show)
    end

    it 'Should include Default text on template' do
      expect(response.body).to include('Post Details')
    end
  end
end
