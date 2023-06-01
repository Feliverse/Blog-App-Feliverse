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

    it 'Should redirect to the user profile page when clicking on the user name' do
      click_link('Felipe')
      expect(page).to have_current_path(user_path(User.first))
    end
  end

  describe 'User #show' do
    before do
      visit users_path(User.first.id)
    end

    it 'Should be able to view profile picture' do
      expect(page).to have_css("img[src*='#{User.first.photo}']")
    end

    it 'Should be able to view the user\'s name' do
      expect(page).to have_content(User.first.name)
    end

    it 'Should be able to see the num of posst the user has written' do
      expect(page).to have_content("Number of posts: #{User.first.post_counter}")
    end

    it 'Should be able to see the user\'s bio' do
      expect(page).to have_content(User.first.bio)
    end
end
end
