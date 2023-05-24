class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = Like.new(user: current_user, post: @post)
    if @like.save!
      @like.update_counter
      redirect_to user_post_path(params[:user_id], params[:post_id]), notice: 'Liked!'
    else
      render :new, status: :unprocessable_entity
    end
  end
end
