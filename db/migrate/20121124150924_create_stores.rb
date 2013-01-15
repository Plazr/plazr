class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :description
      t.string :email
      t.integer :phone
      t.string :url
      
       
      t.timestamps
    end
  end
end
