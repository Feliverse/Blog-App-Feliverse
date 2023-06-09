class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_counter
    post.increment!(:comment_counter)
  end
end
