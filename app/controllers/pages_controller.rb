class PagesController < ApplicationController
  def index
    @formations = Formation.enligne.all.order("created_at DESC").limit(6)
    @articles = Post.enligne.all.order("created_at DESC").limit(3)
  end

  def articles
    @articles = Post.enligne.all.order("created_at DESC")
  end

  def details
    @article = Post.enligne.find(params[:id])
  end

  def formations
    @topformations = Formation.enligne.all.order("orders_count DESC").limit(3)

    if params[:categorie].present?
    @category_id = Category.find(params[:categorie])
    @formations = Formation.enligne.where(category_id: @category_id).order("created_at DESC").page(params[:page]).per(8)
   elsif params[:search].present?
    @formations = Formation.enligne.search(params).order("created_at DESC").page(params[:page]).per(8)
   elsif params[:tag].present?
    @formations = Formation.enligne.tagged_with(params[:tag]).order("created_at DESC").page(params[:page]).per(8)
   else
    @formations = Formation.enligne.all.order("created_at DESC").page(params[:page]).per(8)
   end
    @categories = Category.all
  end


  def apropos
  end

  def expertise
  end
  def expertisemetier
  end

  def novitas
  end

  def contact
  end

  def sendmail
    thename = params[:username]
    from = params[:email]
    subject = params[:subject]
    message = params[:message]
    ContactMailer.send_contact(thename,from,subject,message).deliver_now
  end

  def test
  end

  def appropos
  end



end
