class Admin::OrdersController < ApplicationController
    before_action :authenticate_user!
    before_action :is_admin?
    before_action :set_order, only: [:show, :edit, :update, :destroy]
    layout "applicationadmin"


    def index
        @orders = Order.all.order("created_at DESC")
	end
    
    def show
    end

	def edit
	end

	def update
        if @order.update(order_params)
          flash[:success] = "Commande modifiée avec succé"
		  redirect_to admin_orders_path
		else
		  render 'edit'
		end
	end
	
	def destroy
		if @order.destroy
			flash[:success] = "Commande supprimée avec succé"
			redirect_to admin_orders_path
		else
			redirect_to admin_orders_path
		end
	end
	


	private

	def set_order
		@order = Order.find(params[:id])
	end

	def order_params
        params.require(:order).permit(:firstname, :lastname, :tel, :adresse, :valide)
    end
end
