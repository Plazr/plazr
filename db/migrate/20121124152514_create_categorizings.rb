class CreateCategorizings < ActiveRecord::Migration
  def change
    create_table :categorizings do |t|
      t.integer :store_id
      t.integer :store_category_id
      
      t.timestamps
    end
  end
end
