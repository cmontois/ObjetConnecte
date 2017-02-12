class CreateMoistureReports < ActiveRecord::Migration[5.0]
  def change
    create_table :moisture_reports do |t|
      t.integer :value

      t.timestamps
    end
  end
end
