class Admin::CategoriesController < ApplicationController
	before_action :set_category, only: [:edit, :update, :destroy]

	def index
		@categories = Category.all
	end
	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
		  flash[:success] = "Object successfully created"
		  redirect_to admin_categories_path
		else
		  flash[:error] = "Something went wrong"
		  render 'new'
		end
	end

	def edit
	end

	def update
		if @category.update(category_params)
		  flash[:success] = "Object was successfully updated"
		  redirect_to admin_categories_path
		else
		  flash[:error] = "Something went wrong"
		  render 'edit'
		end
	end
	
	def destroy
		if @category.destroy
			flash[:success] = 'Object was successfully deleted.'
			redirect_to admin_categories_path
		else
			flash[:error] = 'Something went wrong'
			redirect_to admin_categories_path
		end
	end
	


	private

	def set_category
		@category = Category.find(params[:id])
	end

	def category_params
		params.require(:category).permit(:title)
	end
	
	
end
