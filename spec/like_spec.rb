require 'rails_helper'
describe Like, type: :model do
  before do
    @user = User.new(name: 'Felipe', post_counter: 0)
    @user.save
    @post = Post.new(author: @user, title: 'How to become a software developer', text: 'The first step is...',
                     comment_counter: 0, like_counter: 0)
    @post.save
    @like = Like.new(user: @user, post: @post)
    @save_like = @like.save
  end

  it 'Should save a like' do
    expect(@save_like).to eq(true)
  end

  it 'Should increase post counter' do
    @like.update_counter
    expect(@post.like_counter).to eq(1)
  end
end