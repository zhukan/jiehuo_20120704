class ChangeUserAvatarDefaultValue < ActiveRecord::Migration
  def up
    remove_column :users, :avatar
    add_column :users, :avatar, :string,:default => '76c5d3d4afe803226f167caf2cfbb85d407b8b03.jpg'
  end

  def down
  end
end
