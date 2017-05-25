class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.float :temperature
      t.integer :soil_humidity
      t.integer :air_humidity
      t.float :pressure

      t.timestamps
    end
  end
end
