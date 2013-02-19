class RenameCryptedPassword < ActiveRecord::Migration
  def up
    rename_column :users, :crypted_password, :encrypted_password
  end

  def down
  end
end
