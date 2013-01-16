class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :description
      t.string :email
      t.integer :phone
      t.string :url

      t.string :adress
      t.string :postal_code
      t.string :city

      t.string :link_banner
      t.string :link_logo

      t.timestamps
    end
  end
end
