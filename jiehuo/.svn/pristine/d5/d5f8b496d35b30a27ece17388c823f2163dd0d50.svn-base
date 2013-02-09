class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections,:force => true,:id=> false do |t|
      t.column :section_id,:primary_key, :null => false
      t.string :name
      t.text :description
      t.string :creator
      t.string :modifier
      t.references :project

      t.timestamps
    end
  end
end
