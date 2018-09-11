class Formation < ApplicationRecord
  belongs_to :category, :counter_cache => true
  acts_as_taggable
  has_attached_file :image, styles: { medium: "1024x1024", thumb: "500x500" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  scope :enligne, -> { where(online: 1)}
  
  def self.search(params)
  	where("title like ? or objectifs like ? or programme like ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
  end


end
