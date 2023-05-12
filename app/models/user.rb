class User < ApplicationRecord
  validates :name, presence: true
  validates :post_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id

  def show_3_last
    @user = Post.find(params([:author_id])) # Encuentra el usuario por su id
    @last_posts = @user.posts.last(3) # Obtiene los últimos 3 posts de ese usuario
  end
end
