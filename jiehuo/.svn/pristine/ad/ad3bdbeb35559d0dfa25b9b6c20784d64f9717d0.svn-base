# coding: UTF-8
class RemoveProvince < ActiveRecord::Migration
  def up
    Province.delete_all
    Province.create(:provinceid=>'330000',:province=>'浙江省')
  end

  def down
  end
end
