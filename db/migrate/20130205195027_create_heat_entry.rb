class CreateHeatEntry < ActiveRecord::Migration
  def change
    create_table :heat_entries do |t|
      t.references :swimmer
      t.references :swimmer_event_time
      t.references :heat
      t.integer :swim_time
      t.boolean :dq
      t.integer :result_time
      t.integer :lane

      t.timestamps
    end
  end
end
