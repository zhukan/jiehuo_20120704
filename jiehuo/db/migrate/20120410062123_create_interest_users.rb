class CreateInterestUsers < ActiveRecord::Migration
  def change
    create_table :interest_users do |t|
      t.integer :id, :null => false
      t.integer :cur_user_id
      t.integer :int_user_id
      t.integer :score
      t.integer :state

      t.timestamps
    end
  end
end
