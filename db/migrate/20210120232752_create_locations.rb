class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.references :user, null: false, foreign_key: true, optional: true
      t.references :facility, null: false, foreign_key: true, optional: true

      t.string :name
      t.string :type
      t.string :longitude
      t.string :latitude
      t.integer :rating

      t.timestamps
    end
  end
end
