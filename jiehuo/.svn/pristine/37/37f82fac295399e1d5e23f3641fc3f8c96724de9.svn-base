class CreateAsksSections < ActiveRecord::Migration
  def change
    create_table :asks_sections,:force => true,:id=> false do |t|
      t.integer :ask_id, :null => false
      t.integer :section_id,:null=>false
    end

    add_index :asks_sections, :ask_id
    add_index :asks_sections, :section_id
  end
end
