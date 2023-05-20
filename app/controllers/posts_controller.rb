class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments, comments: :user)
  end

  def show
    @post = Post.find(params[:id])
  end
end
