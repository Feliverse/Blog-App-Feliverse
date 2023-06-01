class PostsController < ApplicationController
  def index
    @user = User.find params[:user_id]
    @posts = @user.posts.includes(:comments, comments: :user)
  end

  def show
    @post = Post.find params[:id]
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    if @post.save
      @post.update_counter
      redirect_to user_path(current_user.id), notice: 'New post created!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :author)
  end
end
