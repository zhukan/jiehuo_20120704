# coding: UTF-8
class AddHzSchool < ActiveRecord::Migration
  def up
    School.create(:name=>'杭州高级中学',:creator=>'sys_creator',:modifier=>'sys_modifier',:provinceid=>'330000')
  end

  def down
  end
end
