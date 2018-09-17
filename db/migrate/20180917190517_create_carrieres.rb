class CreateCarrieres < ActiveRecord::Migration[5.2]
  def change
    create_table :carrieres do |t|
      t.string :nom
      t.string :email
      t.string :sujet
      t.text :message

      t.timestamps
    end
  end
end
