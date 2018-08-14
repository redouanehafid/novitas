class FormationsController < ApplicationController
    
    def show
        @formation = Formation.find(params[:id])
        @categories = Category.all
        @nbrformation = Formation.count
    end
    
end
