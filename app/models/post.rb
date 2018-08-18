class Post < ApplicationRecord
	has_many :comments
	has_attached_file :image, styles: { medium: "1224x1224", thumb: "500x500>" }
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
