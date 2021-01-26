class CreateLocationFacilities < ActiveRecord::Migration[6.1]
  def change
    create_table :location_facilities do |t|
      t.references :facility, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true
      t.timestamps
    end
  end
end
