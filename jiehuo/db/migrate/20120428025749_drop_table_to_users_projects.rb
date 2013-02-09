class DropTableToUsersProjects < ActiveRecord::Migration
  def up
    drop_table :users_projects
  end

  def down
  end
end
