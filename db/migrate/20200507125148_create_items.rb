class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

    	t.string :name
    	t.intenger :quantity
    	t.integer :trip_id 

      t.timestamps
    end
  end
end
