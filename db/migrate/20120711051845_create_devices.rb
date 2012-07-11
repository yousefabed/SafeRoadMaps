class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :device_name
      t.string :device_uid
      t.string :google_registration
      t.timestamps
    end
  end
end
