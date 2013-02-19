class CreateSchools < ActiveRecord::Migration
  def self.up
    create_table:schools,:id => false,:force =>true  do |t|
      t.column :school_id,:primary_key, :null => false
      t.string :name
      t.string :creator
      t.string :modifier
      t.references :area
      t.timestamps
    end
  end

  def self.down
    drop_table "schools"
  end
end
