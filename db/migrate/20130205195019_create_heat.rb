class CreateHeat < ActiveRecord::Migration
  def change
    create_table :heats do |t|
      t.references :event
      t.integer :number 
      t.timestamps
    end
  end
end
