class Carriere < ApplicationRecord

	has_attached_file :cv
	validates_attachment :cv, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }
	
	has_attached_file :lettre
	validates_attachment :lettre, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }

	validates :nom, :email, :sujet, :message, :presence => true

end
