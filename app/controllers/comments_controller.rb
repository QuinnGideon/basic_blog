class CommentsController < ApplicationController
  def delete
  end

  def new
  	@comment = Comment.new
  end

  def create
  	@comment = Comment.new(comment_params)
    @post = @comment.post
  	if @comment.save
  	 redirect_to posts_path
  	else 
  	 redirect_to new_post_path	
  	end	
	end


  private

  def comment_params
  	params.require(:comment).permit(:body, :post_id, :user_id)
  end	

end
