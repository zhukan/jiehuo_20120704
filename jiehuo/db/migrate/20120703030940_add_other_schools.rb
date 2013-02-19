# coding: UTF-8
class AddOtherSchools < ActiveRecord::Migration
  def up
    School.create(:name=>'其他',:creator=>'sys_creator',:modifier=>'sys_modifier',:provinceid=>'330000')
  end

  def down
  end
end
