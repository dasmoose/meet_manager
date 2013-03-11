class CreateTeam < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :short_name
      t.string :location
      t.string :coach_name
      t.references :meet
      t.timestamps
    end
  end
end
