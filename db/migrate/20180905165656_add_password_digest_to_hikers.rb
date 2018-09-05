class AddPasswordDigestToHikers < ActiveRecord::Migration[5.2]
  def change
    add_column :hikers, :password_digest, :string
    rename_column :hikers, :name, :username
  end
end
