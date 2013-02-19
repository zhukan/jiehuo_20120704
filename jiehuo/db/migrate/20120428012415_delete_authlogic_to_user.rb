class DeleteAuthlogicToUser < ActiveRecord::Migration
  def up


    #删除head_images_url,persistence_token,Perishable_token,login_count,failed_login_count,last_request_at,last_login_at,current_login_at

    remove_column :users, :head_images_url
    remove_column :users, :nick
    remove_column :users, :persistence_token
    remove_column :users, :Perishable_token
    remove_column :users, :login_count
    remove_column :users, :failed_login_count
    remove_column :users, :last_login_at
    remove_column :users, :current_login_at




  end

  def down
  end
end
