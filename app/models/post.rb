class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  validates :title, presence: true, length: { maximum: 250 }
  validates :comment_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :like_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :comments
  has_many :likes

  def update_counter
    author.increment!(:post_counter)
  end

  def last_5_comments
    comments.order(created_at: :desc).limit(5)
  end
end
