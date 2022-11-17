class PostsController < ApplicationController




  def index

      @post = Post.new
      @posts = Post.all
  end


  def create

    @post = Post.new(allowed_post_params)
    @post.User = current_user

      if @post.save
        redirect_to root_path
       else
        flash[:alert] = "Members Only"
        redirect_to root_url 
     
      end
  end




  end

  def destroy
  end

  private
  def allowed_post_params
    params.require(:post).permit(:title, :body)
  end

