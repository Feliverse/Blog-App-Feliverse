class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  # We use a class attribute to store the last 5 comments
  @@last_5_comments = []
  
  # We use a callback after_save to update the attribute every time a comment is saved

  after_save :update_last_5_comments
  
  # We use a callback after_save to update the attribute every time a comment is saved
  def self.last_5_comments
    @@last_5_comments
  end
  
  # We define a private method to update the attribute with the newly saved comment
  private
  
  def update_last_5_comments
    # Add the comment to the beginning of the array
    @@last_5_comments.unshift (self)
    # We remove the last element of the array if it has more than 5 elements
    @@last_5_comments.pop if @@last_5_comments.size > 5
  end
  
  def update_counter
    author.increment!(:post_counter)
  end

end
