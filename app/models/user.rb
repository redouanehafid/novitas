class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_many :comments

   has_attached_file :image, styles: { thumb: "300x300" }
   validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
