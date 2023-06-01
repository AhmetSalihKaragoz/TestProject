class MealPlansController < ApplicationController
  def show
    @meal_plans = Current.user.meal_plans
  end
end
