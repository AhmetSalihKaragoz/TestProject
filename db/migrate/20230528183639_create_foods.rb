class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :calories
      t.float :fat
      t.float :carbs
      t.float :protein

      t.timestamps
    end
  end
end
