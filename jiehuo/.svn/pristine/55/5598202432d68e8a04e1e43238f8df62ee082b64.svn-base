class CreateTableOption < ActiveRecord::Migration
  def up
    create_table :options,:id => false,:force =>true do |t|
      t.column :option_id,:primary_key, :null => false
      t.string :ask_id
      t.text :detail
      t.string :creator
      t.string :modifier

      t.timestamps
    end
  end

  def down
  end
end
