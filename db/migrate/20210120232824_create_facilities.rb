class CreateFacilities < ActiveRecord::Migration[6.1]
  def change
    create_table :facilities do |t|
      t.string :type
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
