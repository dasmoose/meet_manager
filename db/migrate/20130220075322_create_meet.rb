class CreateMeet < ActiveRecord::Migration
  def change
    create_table :meets do |t|
      t.string :name
      t.string :location
      t.integer :pool_size
    end
  end
end
