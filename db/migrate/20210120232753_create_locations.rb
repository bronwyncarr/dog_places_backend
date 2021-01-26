class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.references :user, null: false, foreign_key: true, optional: false
      t.references :location_type, null: false, foreign_key: true, optional: false

      t.string :name
      t.string :address
      
      t.string :longitude
      t.string :latitude
      t.integer :rating

      t.timestamps
    end
  end
end