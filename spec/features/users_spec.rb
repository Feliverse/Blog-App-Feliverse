require 'rails_helper'
RSpec.describe 'Users' do
  describe 'User #index' do
    before do
      visit users_path
    end
  
    it 'Should be able to view profile pictures' do
      @users = User.all
      @users.each  do |user|
        expect(page).to have_css("img[src*='#{user.photo}']")
      end
    end

    it 'Should be able to see the number of posts each user has written' do
      @users = User.all
      @users.each  do |user|
        expect(page).to have_content("Number of posts: #{user.post_counter}")
      end
    end
  end
end
