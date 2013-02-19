class ChangeSchoolAreaToProvince < ActiveRecord::Migration
  def up
    remove_column :schools, :area_id
    add_column :schools, :provinceid, :string
  end

  def down
  end
end
