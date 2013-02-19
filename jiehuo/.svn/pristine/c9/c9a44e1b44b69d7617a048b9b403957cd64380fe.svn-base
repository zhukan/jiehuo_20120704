class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers,:force => true,:id=> false do |t|
      t.column :answer_id,:primary_key, :null => false
      t.text :result
      t.text :comment
      t.string :modifier
      t.references :user
      t.references :ask

      t.timestamps
    end
  end
end
