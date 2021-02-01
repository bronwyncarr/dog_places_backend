# frozen_string_literal: true

class CreateLocationTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :location_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
