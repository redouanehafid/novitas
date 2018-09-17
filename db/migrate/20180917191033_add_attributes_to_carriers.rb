class AddAttributesToCarriers < ActiveRecord::Migration[5.2]
  def up
    add_attachment :carrieres, :cv
    add_attachment :carrieres, :lettre
  end

  def down
    remove_attachment :carrieres, :cv
    remove_attachment :carrieres, :lettre
  end
end
