class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_counter
    post.increment!(:like_counter)
  end
end
