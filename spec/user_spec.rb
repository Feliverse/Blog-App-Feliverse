require 'rails_helper'
describe User, type: :model do
  it 'Is invalid without a name' do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it 'Post counter must be integer' do
    user = User.new(name: 'Felipe', post_counter: 2.5)
    user.valid?
    expect(user.errors[:post_counter]).to include('must be an integer')
  end

  it 'Post counter must be a number' do
    user = User.new(name: 'son', post_counter: 'asdsa')
    user.valid?
    expect(user.errors[:post_counter]).to include('is not a number')
  end

  it 'Should return the last 3 posts' do
    user = User.new(name: 'Felipe', post_counter: 0)
    user.save
    post1 = Post.new(author: user, title: 'Hello1', text: 'This is my first post', comment_counter: 0, like_counter: 0,
                     created_at: 1.day.ago)
    post2 = Post.new(author: user, title: 'Hello2', text: 'This is my second post', comment_counter: 0,
                     like_counter: 0, created_at: 2.day.ago)
    post3 = Post.new(author: user, title: 'Hello3', text: 'This is my third post', comment_counter: 0, like_counter: 0,
                     created_at: 3.day.ago)
    post4 = Post.new(author: user, title: 'Hello4', text: 'This is my fourth post', comment_counter: 0,
                     like_counter: 0, created_at: 4.day.ago)
    post1.save
    post2.save
    post3.save
    post4.save
    expect(user.last_3_posts).to eq([post1, post2, post3])
  end
end