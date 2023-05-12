class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, foreign_key: 'post_id'

  after_initialize :update_counter

  def update_counter
    post.increment!(:like_counter)
  end
end
