class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :price
      t.boolean :caffeinated

      t.timestamps
    end
  end
end
