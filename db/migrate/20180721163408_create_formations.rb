class CreateFormations < ActiveRecord::Migration[5.2]
  def change
    create_table :formations do |t|
      t.string :code
      t.string :title
      t.string :volume
      t.text :objectifs
      t.text :prerequis
      t.text :programme
      t.text :intervenants
      t.text :public_concerne
      t.text :les_plus
      t.text :certifications
      t.text :cgf
      t.string :lieu
      t.integer :duree
      t.float :tarif
      t.references :category, foreign_key: true
      t.boolean :online

      t.timestamps
    end
  end
end
