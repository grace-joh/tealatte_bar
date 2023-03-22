class CreateDrinks < ActiveRecord::Migration[5.2]
  def change
    create_table :drinks do |t|
      t.string :name
      t.integer :calories
      t.boolean :has_milk

      t.timestamps
    end
  end
end
