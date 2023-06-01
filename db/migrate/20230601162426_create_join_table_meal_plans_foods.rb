class CreateJoinTableMealPlansFoods < ActiveRecord::Migration[7.0]
  def change
    create_join_table :meal_plans, :foods do |t|
      # t.index [:meal_plan_id, :food_id]
      # t.index [:food_id, :meal_plan_id]
    end
  end
end
