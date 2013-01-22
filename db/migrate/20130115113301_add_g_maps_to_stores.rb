class AddGMapsToStores < ActiveRecord::Migration
  def change
  	add_column :stores, :latitude,  :float #you can change the name, see wiki
	add_column :stores, :longitude, :float #you can change the name, see wiki
	add_column :stores, :gmaps, :boolean
  end
end
