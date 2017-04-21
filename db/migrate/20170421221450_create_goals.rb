class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.integer :user_id, null: false
      t.string :goal_title, null: false
      t.text :goal_description
      t.boolean :achieved, null: false, default: false
      t.timestamps
    end
    add_index :goals, :user_id
  end
end
