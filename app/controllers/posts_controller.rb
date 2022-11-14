class PostsController < ApplicationController

  before_action :authenticate_user!
  def index
    @index = Post.new
    @indexs = Post.all.order(created_at: :asc)
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "thank you for posting"
      redirect_to @post
    else
      flash.now[:error] = "invalid post"
      render :new, status: :unprocessable_entity
    end

  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end
