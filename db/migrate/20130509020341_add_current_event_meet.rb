class AddCurrentEventMeet < ActiveRecord::Migration
  def change
    add_column :meets, :event, :refernce
  end
end
