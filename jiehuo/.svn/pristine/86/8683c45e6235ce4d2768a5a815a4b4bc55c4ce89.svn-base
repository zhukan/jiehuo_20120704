class CreateAsks < ActiveRecord::Migration
  def change
    create_table :asks,:force => true,:id=> false do |t|
      t.column :ask_id,:primary_key, :null => false
      t.text :body
      t.text :body_item
      t.string :type
      t.text :result
      t.text :comment
      t.string :modifier
      t.references :user

      t.timestamps
    end
  end
end
