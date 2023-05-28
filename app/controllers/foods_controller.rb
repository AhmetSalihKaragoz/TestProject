class FoodsController < ApplicationController
    before_action :set_food, only: [:show]
  
    def show
      @food = Food.find_by(id: params[:id])
    end
    
  
    def params_food
      params.require(:food).permit(:name, :calories, :carbs, :protein, :fat)
    end
  
    private
  
    def set_food
      @food = Food.find_by(id: params[:id])
    end
end
  
  