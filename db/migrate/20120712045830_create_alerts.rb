class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.string :message
      t.integer :location_id
      t.text :gis_message

      t.timestamps
    end
  end
end
