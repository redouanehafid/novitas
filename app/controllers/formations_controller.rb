class FormationsController < ApplicationController
    
    def show
        @formation = Formation.find(params[:id])
        @categories = Category.all
        @nbrformation = Formation.count
        @topformations = Formation.all.order("orders_count DESC").limit(3)
    end
    
end
