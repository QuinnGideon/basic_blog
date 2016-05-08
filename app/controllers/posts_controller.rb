class PostsController < ApplicationController

  def new
    @post = Post.new
  
  end

  def create
    @post = Post.new(body: params[:post][:body], user_id: params[:post][:user_id])
    if @post.save
      flash[:notice] = "Post was saved"
    redirect_to posts_path
     else 
       flash[:alert] = "error"
      redirect_to posts_path
    end

  end

  def index
    @users = User.all
    @posts = Post.all
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
     @post = Post.find(params[:id])
     if @post.destroy
       flash[:notice] = "Post was deleted"
     else 
       flash[:alert] = "error"
     end
     redirect_to posts_path
   end

  def update
    @p = Post.find(params[:id])
    @p.update(post_params)
    redirect_to post_path(@post)
  end

  def edit
    @p = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end

end
