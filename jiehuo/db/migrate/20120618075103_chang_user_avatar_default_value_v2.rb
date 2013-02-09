class ChangUserAvatarDefaultValueV2 < ActiveRecord::Migration
  def up
    remove_column :users, :avatar
    add_column :users, :avatar, :string,:default => 'da9133bf0c9a216aec57fb2dcf394017a04e8f62.jpg'
  end

  def down
  end
end
