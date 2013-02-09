class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains,:force => true,:id=> false do |t|
      t.column :domain_id,:primary_key, :null => false
      t.string :name
      t.text :description
      t.string :creator
      t.string :modifier

      t.timestamps
    end
  end
end
