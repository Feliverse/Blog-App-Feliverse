require 'rails_helper'
describe Post, type: :model do
  subject do
    user = User.new(name: 'Natasha', photo: 'https://Natish.com', bio: 'Queen')
    Post.new(author: user, title: 'Title 1', text: 'Text 1', comments_counter: 0, likes_counter: 0)
  end
  it 'Title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end
  # Asociaciones
  #it { should belong_to(:author).class_name('User') }
  #it { should have_many(:comments) }
  #it { should have_many(:likes) }

  # Validaciones
  # it { should validate_presence_of(:title) }
  # it { should validate_length_of(:title).is_at_most(250) }
  # it { should validate_numericality_of(:comment_counter).only_integer.is_greater_than_or_equal_to(0) }
  # it { should validate_numericality_of(:like_counter).only_integer.is_greater_than_or_equal_to(0) }
end