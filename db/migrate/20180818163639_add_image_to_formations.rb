class AddImageToFormations < ActiveRecord::Migration[5.2]
  	 def up
	    add_attachment :formations, :image
	 end

	 def down
	    remove_attachment :formations, :image
	 end
end
