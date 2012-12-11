class CreateStoreCategories < ActiveRecord::Migration
  def change
    create_table :store_categories do |t|
      t.string :title
      t.string :description
  
      t.timestamps
    end
  end
end
