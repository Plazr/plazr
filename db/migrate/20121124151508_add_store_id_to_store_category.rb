class AddStoreIdToStoreCategory < ActiveRecord::Migration
  def change
    add_column :store_categories, :store_id, :integer
  end
end
