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
        @order = Order.new(params[:order])
        @order.formation_id = @formation.id
        @order.user_id = @user.id
        if @order.save
          flash[:success] = "Object successfully created"
          redirect_to formations_path
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end

end
