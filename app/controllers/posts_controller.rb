class PostsController < ApplicationController




  def index

      @post = Post.new
      @posts = Post.all
  end

  def show
    @post = Post.find(allowed_post_params{:id})
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
    @post = Post.find(allowed_post_params).destroy
    redirect_to root_url
     

  end

  private
  def allowed_post_params
    params.require(:post).permit(:title, :body)
  end

