class CreatePlansController < ApplicationController
  before_action :set_meal_plan, only: [:new, :create]

  def new
  end

  def create
    if Current.user
      @meal_plan = Current.user.meal_plans.build(meal_plan_params)
      if @meal_plan.save
        redirect_to meal_plans_path, notice: "Successfully created a meal plan"
      else
        render :new
      end
    end
  end


  private

  def set_meal_plan
    @meal_plan = MealPlan.new
  end

  def meal_plan_params
    params.require(:meal_plan).permit(:name, :user_id)
  end
end
