class CreateFavoriteAsks < ActiveRecord::Migration
  def change
    create_table :favorite_asks do |t|
      t.integer :user_id
      t.integer :ask_id

      t.timestamps
    end
  end
end
