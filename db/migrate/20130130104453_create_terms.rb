class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      t.boolean :terms

      t.timestamps
    end
  end
end
