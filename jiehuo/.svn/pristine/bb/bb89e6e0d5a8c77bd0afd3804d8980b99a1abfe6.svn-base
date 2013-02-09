class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments,:force => true,:id=> false do |t|
      t.column :comment_id,:primary_key, :null => false
      t.text :body
      t.string :modifier
      t.references :user
      t.references :answer

      t.timestamps
    end
  end
end
