class CreatePaymentMethods < ActiveRecord::Migration
    def change
    create_table :payment_methods do |t|
      t.string :title
      t.string :description

      t.timestamps
    end         
  end
end
