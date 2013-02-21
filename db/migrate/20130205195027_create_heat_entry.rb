class CreateHeatEntry < ActiveRecord::Migration
  def change
    create_table :heat_entries do |t|
      t.references :swimmer
      t.references :heat
      t.references :swim_time
      t.boolean :dq
      t.integer :result_time

      t.timestamps
    end
  end
end
