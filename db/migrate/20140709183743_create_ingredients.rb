class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :item
      t.string :amount

      t.timestamps
    end
  end
end
