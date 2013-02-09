class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users,:force => true,:id=> false  do |t|
      t.column :user_id,:primary_key, :null => false
      t.string :email
      t.string :name
      t.string :crypted_password
      t.text :introduce
      t.string :head_images_url
      t.references :school

      t.timestamps
    end
  end
end
