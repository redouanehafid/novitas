class Admin::PostsController < ApplicationController

	before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
        @posts = Post.all.order("online DESC")
	end
	def new
		@post = Post.new
    end
    
    def show
        @comments = @post.comments.order("created_at DESC")
    end
    
	def create
		@post = Post.new(post_params)
		if @post.save
		  flash[:success] = "Object successfully created"
		  redirect_to admin_posts_path
		else
		  flash[:error] = "Something went wrong"
		  render 'new'
		end
	end

	def edit
	end

	def update
		if @post.update(post_params)
		  flash[:success] = "Object was successfully updated"
		  redirect_to admin_posts_path
		else
		  flash[:error] = "Something went wrong"
		  render 'edit'
		end
	end
	
	def destroy
		if @post.destroy
			flash[:success] = 'Object was successfully deleted.'
			redirect_to admin_posts_path
		else
			flash[:error] = 'Something went wrong'
			redirect_to admin_posts_path
		end
	end
	


	private

	def set_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :content, :online)
	end
end
