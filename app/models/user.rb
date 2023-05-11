class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id

  def show_3_last
    @user = User.find (params [:id]) # Encuentra el usuario por su id
    @last_posts = @user.posts.last (3) # Obtiene los últimos 3 posts de ese usuario
  end
end
