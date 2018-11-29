class CreatePetTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :pet_types do |t|
      t.references :type, foreign_key: true
      t.references :pet, foreign_key: true

      t.timestamps
    end
  end
end
