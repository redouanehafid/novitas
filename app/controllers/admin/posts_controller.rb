class Admin::PostsController < ApplicationController
	before_action :authenticate_user!
  	before_action :is_admin?
	before_action :set_post, only: [:show, :edit, :update, :destroy]
	layout "applicationadmin"

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
		  flash[:success] = "L'article a été créée avec succès."
		  redirect_to admin_posts_path
		else
		  flash[:error] = "Quelque chose a mal tourné"
		  render 'new'
		end
	end

	def edit
	end

	def update
		if @post.update(post_params)
		  flash[:success] = "L'article a été mis à jour avec succès."
		  redirect_to admin_posts_path
		else
		  flash[:error] = "Quelque chose a mal tourné"
		  render 'edit'
		end
	end
	
	def destroy
		if @post.destroy
			flash[:success] = "L'article a été détruite avec succès."
			redirect_to admin_posts_path
		else
			flash[:error] = 'Quelque chose a mal tourné'
			redirect_to admin_posts_path
		end
	end
	


	private

	def set_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :content, :online, :image)
	end
end
