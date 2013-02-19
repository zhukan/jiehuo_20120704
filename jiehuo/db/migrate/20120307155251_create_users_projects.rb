class CreateUsersProjects < ActiveRecord::Migration
  def change
    create_table :users_projects,:force => true,:id=> false do |t|
      t.integer :user_id, :null => false
      t.integer :project_id,:null=>false
    end

    add_index :users_projects, :user_id
    add_index :users_projects, :project_id
  end
end
