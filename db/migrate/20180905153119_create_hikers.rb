class CreateHikers < ActiveRecord::Migration[5.2]
  def change
    create_table :hikers do |t|
      t.string :name
      t.string :hometown

      t.timestamps
    end
  end
end