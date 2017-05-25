class CreateHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :histories do |t|
      t.string :verb
      t.datetime :started_at
      t.datetime :ended_at

      t.timestamps
    end
  end
end
