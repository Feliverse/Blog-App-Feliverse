require 'rails_helper'
describe Post, type: :model do
  it 'Is invalid without a title' do
    post = Post.new(title: nil, text: 'This an example to create a post')
    post.valid?
    expect(post.errors[:title]).to include("can't be blank")
  end

  it 'Title should not be longer than 250 characters' do
    long_title = 'Titlte' * 251
    post = Post.new(title: long_title, text: 'This an example to create a post')
    post.valid?
    expect(post.errors[:title]).to include('is too long (maximum is 250 characters)')
  end

  it 'Comment counter must be integer' do
    post = Post.new(title: 'Title', text: 'This an example to create a post', comment_counter: 2.5)
    post.valid?
    expect(post.errors[:comment_counter]).to include('must be an integer')
  end

  it 'Comment counter must be a number' do
    post = Post.new(title: 'Title', text: 'This an example to create a post', comment_counter: 'mchhsa')
    post.valid?
    expect(post.errors[:comment_counter]).to include('is not a number')
  end

  it 'Like counter must be integer' do
    post = Post.new(title: 'Title', text: 'This an example to create a post', like_counter: 2.5)
    post.valid?
    expect(post.errors[:like_counter]).to include('must be an integer')
  end

  it 'Like counter must be a number' do
    post = Post.new(title: 'Title', text: 'This an example to create a post', like_counter: 'mchhsa')
    post.valid?
    expect(post.errors[:like_counter]).to include('is not a number')
  end

  it 'Should increment post counter' do
    author = User.new(name: 'George', post_counter: 0)
    author.save
    post = Post.new(author:, title: 'Hello1', text: 'This is my first post', comment_counter: 0,
                    like_counter: 0)
    post.save
    post.update_counter
    expect(author.post_counter).to eq(1)
  end

  it 'Should return the last 5 comments' do
    author = User.new(name: 'George', post_counter: 0)
    author.save
    post = Post.new(author:, title: 'Hello1', text: 'This is my first post', comment_counter: 0,
                    like_counter: 0)
    post.save
    comment1 = Comment.new(user: author, post:, text: 'Nice 1!', created_at: 1.day.ago)
    comment2 = Comment.new(user: author, post:, text: 'Nice 2!', created_at: 2.day.ago)
    comment3 = Comment.new(user: author, post:, text: 'Nice 3!', created_at: 3.day.ago)
    comment4 = Comment.new(user: author, post:, text: 'Nice 4!', created_at: 4.day.ago)
    comment5 = Comment.new(user: author, post:, text: 'Nice 5!', created_at: 5.day.ago)
    comment6 = Comment.new(user: author, post:, text: 'Nice 6!', created_at: 6.day.ago)
    comment7 = Comment.new(user: author, post:, text: 'Nice 7!', created_at: 7.day.ago)
    comment1.save
    comment2.save
    comment3.save
    comment4.save
    comment5.save
    comment6.save
    comment7.save
    expect(post.last_5_comments).to eq([comment1, comment2, comment3, comment4, comment5])
  end
end
