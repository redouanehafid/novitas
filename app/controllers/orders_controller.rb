class OrdersController < ApplicationController

    before_action :authenticate_user!

    def new
        @order = Order.new
        @formation = Formation.find(params[:formation_id])
        @categories = Category.all
        @nbrformation = Formation.count

        @user = current_user
        @order.formation_id = @formation.id
        @order.user_id = @user.id
    end
    
    def create
        @formation = Formation.find(params[:formation_id])
        @user = current_user
        @order = Order.new(order_params)
        @order.formation_id = @formation.id
        @order.user_id = @user.id
        if @order.save
          flash[:success] = "Votre commande a été ajoutée avec succé, nous allons vous contacter dans les plus brefs delais"
          redirect_to root_path
        else
          render 'new'
        end
    end

    def order_params
		  params.require(:order).permit(:firstname, :lastname, :tel, :adresse)
	  end

end
