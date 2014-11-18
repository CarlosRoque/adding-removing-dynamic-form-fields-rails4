class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
	   t.references :job, index: true
	  t.string :name
	  
      t.timestamps
    end
  end
end
