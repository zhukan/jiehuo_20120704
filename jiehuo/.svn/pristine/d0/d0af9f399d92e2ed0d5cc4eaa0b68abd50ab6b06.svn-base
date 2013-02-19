class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects,:force => true,:id=> false do |t|
      t.column :project_id,:primary_key, :null => false
      t.string :name
      t.text :description
      t.string :creator
      t.string :modifier
      t.references :domain

      t.timestamps
    end
  end
end
