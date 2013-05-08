class AddCurrentMeetBool < ActiveRecord::Migration
  def change
    add_column :meets, :current_meet, :boolean
  end
end
