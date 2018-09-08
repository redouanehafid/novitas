class PagesController < ApplicationController
  def index
    @formations = Formation.all.order("created_at DESC").limit(6)
    @articles = Post.all.order("created_at DESC").limit(3)
  end

  def articles
    @articles = Post.all.order("created_at DESC")
  end

  def details
    @article = Post.find(params[:id])
  end

  def formations
    @topformations = Formation.all.order("orders_count DESC").limit(3)

    if params[:categorie].present?
    @category_id = Category.find(params[:categorie])
    @formations = Formation.where(category_id: @category_id).order("created_at DESC").page(params[:page]).per(8)
   elsif params[:search].present?
    @formations = Formation.search(params).order("created_at DESC").page(params[:page]).per(8)
   elsif params[:tag].present?
    @formations = Formation.tagged_with(params[:tag]).order("created_at DESC").page(params[:page]).per(8)
   else
    @formations = Formation.all.order("created_at DESC").page(params[:page]).per(8)
   end
    @categories = Category.all
  end


  def apropos
  end

  def contact
  end

end
