# coding: UTF-8
class AddAdminUsertoUsers < ActiveRecord::Migration
  def up
    User.create(:email => 'iknown@sina.com', :name => 'iknown_admin', :password => 'admin',:password_confirmation=>'admin', :school_id => 21)
  end

  def down
  end
end
