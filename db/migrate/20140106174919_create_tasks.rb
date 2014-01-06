class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :project_id
      t.integer :user_id
      t.string :state

      t.timestamps
    end
  end
end
