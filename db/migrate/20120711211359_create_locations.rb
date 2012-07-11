class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :device_id
      t.float :lat
      t.float :lng
      t.string :source

      t.timestamps
    end
  end
end
