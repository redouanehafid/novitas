class Admin::CategoriesController < ApplicationController
	before_action :authenticate_user!
  	before_action :is_admin?
	before_action :set_category, only: [:edit, :update, :destroy]

	layout "applicationadmin"

	def index
		@categories = Category.all
	end
	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
		  flash[:success] = "Categorie a été créé avec succès"
		  redirect_to admin_categories_path
		else
		  flash[:error] = "Quelque chose a mal tourné"
		  render 'new'
		end
	end

	def edit
	end

	def update
		if @category.update(category_params)
		  flash[:success] = "Categorie a été mis à jour avec succès."
		  redirect_to admin_categories_path
		else
		  flash[:error] = "Quelque chose a mal tourné"
		  render 'edit'
		end
	end
	
	def destroy
		if @category.destroy
			flash[:success] = 'Categorie a été détruite avec succès.'
			redirect_to admin_categories_path
		else
			flash[:error] = 'Quelque chose a mal tourné'
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
