class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :procedure
      t.belongs_to :recipe, index: true

      t.timestamps
    end
  end
end
