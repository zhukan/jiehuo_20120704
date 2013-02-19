class CreateAreas < ActiveRecord::Migration
  def self.up
    create_table :areas,:force => true,:id => false do |t|
      t.column :area_id,:primary_key, :null => false
      t.string :name
      t.string :creator
      t.string :modifier
      t.timestamps
    end
  end
  def self.down
    drop_table "areas"
  end
end
