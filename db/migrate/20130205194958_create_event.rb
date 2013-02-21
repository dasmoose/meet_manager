class CreateEvent < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :race_type
      t.integer :number
      t.string :gender
      t.string :age
      
      t.timestamps
    end
  end
end
