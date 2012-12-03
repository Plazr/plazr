class CreateCategorizes < ActiveRecord::Migration
  def change
    create_table :categorizes do |t|
      t.integer :store_id
      t.integer :store_category_id
    end
  end
end
