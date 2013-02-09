class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :cityid
      t.string :city
      t.string :fatherid

      t.timestamps
    end
  end
end
