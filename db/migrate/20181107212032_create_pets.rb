class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :names
      t.date :date_of_birth
      t.float :rating
      t.references :user, foreign_key: true
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
