class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, foreign_key: 'post_id'

  def update_counter
    post.increment!(:comment_counter)
  end
end
