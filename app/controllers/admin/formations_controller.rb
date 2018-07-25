class Admin::FormationsController < ApplicationController
	before_action :set_formation, only: [:show, :edit, :update, :destroy]

	def index
        @formations = Formation.all.order("online DESC")
	end
	def new
		@formation = Formation.new
    end
    
    def show
        # @comments = @post.comments.order("created_at DESC")
    end
    
	def create
		@formation = Formation.new(formation_params)
		if @formation.save
		  flash[:success] = "Object successfully created"
		  redirect_to admin_formations_path
		else
		  flash[:error] = "Something went wrong"
		  render 'new'
		end
	end

	def edit
	end

	def update
		if @formation.update(formation_params)
		  flash[:success] = "Object was successfully updated"
		  redirect_to admin_formations_path
		else
		  flash[:error] = "Something went wrong"
		  render 'edit'
		end
	end
	
	def destroy
		if @formation.destroy
			flash[:success] = 'Object was successfully deleted.'
			redirect_to admin_formations_path
		else
			flash[:error] = 'Something went wrong'
			redirect_to admin_formations_path
		end
	end
	


	private

	def set_formation
		@formation = Formation.find(params[:id])
	end

	def formation_params
		params.require(:formation).permit(:code, :title, :online, :volume, :objectifs, :prerequis, :programme, :intervenants, :public_concerne, :les_plus, :certifications, :cgf, :lieu, :duree, :tarif, :category_id)
	end
end