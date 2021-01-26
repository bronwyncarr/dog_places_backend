class CreateLocationFacilities < ActiveRecord::Migration[6.1]
  def change
    create_table :location_facility do |t|
    t.references :location, null: false, foreign_key: true
    t.references :facility, null: false, foreign_key: true
    end
  end
end