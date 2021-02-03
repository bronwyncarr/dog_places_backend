# frozen_string_literal: true

class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.references :location_type, null: false, foreign_key: true, optional: false

      t.string :name
      t.string :address
      t.text :description
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
