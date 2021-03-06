class Admin::CommentsController < ApplicationController
	before_action :authenticate_user!
	before_action :is_admin?
	layout "applicationadmin"
	
    def create
		@post = Post.find(params[:post_id])
        @comment = Comment.create(params[:comment].permit(:content))
        @comment.user_id = current_user.id
		@comment.post_id = @post.id

		if @comment.save
			redirect_to admin_post_path(@post)
		else
			redirect_to admin_post_path(@post)
		end
    end
    
    def destroy
        @post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to admin_post_path(@post)
	end
    
end
