class CreateAspirations < ActiveRecord::Migration[5.2]
  def change
    create_table :aspirations do |t|
      t.integer :hiker_id
      t.integer :trail_id
      t.boolean :completed, :default => "false"

      t.timestamps
    end
  end
end
