class CreateStoreCategories < ActiveRecord::Migration
  def change
    create_table :store_categories do |t|
      t.string :title
      t.string :description
      t.string :parent
  
      t.timestamps
    end
  end
end
