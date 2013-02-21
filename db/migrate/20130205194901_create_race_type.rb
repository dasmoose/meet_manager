class CreateRaceType < ActiveRecord::Migration
  def change
    create_table :race_types do |t|
      t.string :stroke
      t.integer :distance
      t.boolean :individual
      t.timestamps
    end
  end
end
