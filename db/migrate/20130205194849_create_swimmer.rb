class CreateSwimmer < ActiveRecord::Migration
  def change
  	create_table :swimmers do |t|
   		t.string :first_name
  		t.string :last_name
                t.string :age
  		t.references :team
  		t.boolean :checked_in
      
  		t.timestamps
  	end
  end
end
