# coding: UTF-8
class AddMidSchool < ActiveRecord::Migration
  def up
    School.delete_all
    School.create(:name=>'杭州十四中学',:creator=>'sys_creator',:modifier=>'sys_modifier',:provinceid=>'330000')
    School.create(:name=>'杭州学军中学',:creator=>'sys_creator',:modifier=>'sys_modifier',:provinceid=>'330000')
    School.create(:name=>'杭州市拱宸中学',:creator=>'sys_creator',:modifier=>'sys_modifier',:provinceid=>'330000')
    School.create(:name=>'嘉兴市第一中学',:creator=>'sys_creator',:modifier=>'sys_modifier',:provinceid=>'330000')
  end

  def down
  end
end
