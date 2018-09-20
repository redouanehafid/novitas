class Admin::FormationsController < ApplicationController
	before_action :authenticate_user!
  	before_action :is_admin?
	before_action :set_formation, only: [:show, :edit, :update, :destroy]
	layout "applicationadmin"

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
		  flash[:success] = "Formation a été créée avec succès."
		  redirect_to admin_formations_path
		else
		  flash[:error] = "Quelque chose a mal tourné"
		  render 'new'
		end
	end

	def edit
	end

	def update
		if @formation.update(formation_params)
		  flash[:success] = "Formation a été mis à jour avec succès."
		  redirect_to admin_formations_path
		else
		  flash[:error] = "Quelque chose a mal tourné"
		  render 'edit'
		end
	end
	
	def destroy
		if @formation.destroy
			flash[:success] = 'Formation a été détruite avec succès.'
			redirect_to admin_formations_path
		else
			flash[:error] = 'Quelque chose a mal tourné'
			redirect_to admin_formations_path
		end
	end
	


	private

	def set_formation
		@formation = Formation.find(params[:id])
	end

	def formation_params
		params.require(:formation).permit(:code, :title, :online, :volume, :objectifs, :prerequis, :programme, :intervenants, :public_concerne, :les_plus, :certifications, :cgf, :lieu, :duree, :tarif, :category_id, :tag_list, :image)
	end
end