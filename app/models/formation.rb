class Formation < ApplicationRecord
  belongs_to :category, :counter_cache => true

  acts_as_taggable

  def self.search(params)
  	where("title like ? or objectifs like ? or programme like ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
  end


end
