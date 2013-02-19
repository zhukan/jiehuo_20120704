class AddColumnInterestUsersBuffs < ActiveRecord::Migration
  def up
    add_column :interest_users_buffs, :reason, :string
  end

  def down
  end
end
