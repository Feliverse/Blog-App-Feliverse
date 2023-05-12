class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  validates :title, presence: true, length: { maximum: 250 }
  validates :comment_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :like_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  
  has_many :comments
  has_many :likes

  # We use a class instance attribute to store the last 5 comments
  @last_5_comments_result = []

  # We use a callback after_save to update the attribute every time a comment is saved
  after_save :update_last_5_comments

  # We use a method to initialize the attribute once
  def self.last_5_comments
    @last_5_comments_result ||= [] # rubocop:disable Naming/MemoizedInstanceVariableName
  end

  # We use attr_reader to define a reader method for the attribute
  attr_reader :last_5_comments_result

  # We define a private method to update the attribute with the newly saved comment
  private

  def update_last_5_comments
    # Add the comment to the beginning of the array
    self.class.last_5_comments.unshift(self)
    # We remove the last element of the array if it has more than 5 elements
    self.class.last_5_comments.pop if self.class.last_5_comments.size > 5
  end
  
  def update_counter
    author.increment!(:post_counter)
  end

end
