class FoodsController < ApplicationController
  require 'net/http'
  require 'json'

  def index
    @foods = Food.all
    if params[:query].present?
      query = params[:query]
      if food_exist_in_db?(query)
        @food = @foods.where("name LIKE ?", "%#{query}%").first
        redirect_to foods_show_path(id: @food.id)
      else
        food_data = get_food_data(query)
        if food_data.present?
          @food = create_food(food_data)
          redirect_to foods_show_path(id: @food.id)
        else
          redirect_to root_path, notice: "Food named #{query} doesn't exist"
        end
      end
    end
  end

  def show
    @food = Food.find(params[:id])
  end

  private

  def create_food(food_data)
    Food.create(
      name: food_data['label'],
      calories: food_data['nutrients']['ENERC_KCAL'],
      protein: food_data['nutrients']['PROCNT'],
      carbs: food_data['nutrients']['CHOCDF'],
      fat: food_data['nutrients']['FAT']
    )
  end

  def get_food_data(query)
    uri = URI("https://api.edamam.com/api/food-database/v2/parser?app_id=898c59ec&app_key=73118762a259e155defd241e556caf15&ingr=#{query}")
    response = Net::HTTP.get(uri)
    data = JSON.parse(response)
    food_data = data['parsed'][0]['food'] if data['parsed'] && data['parsed'][0] && data['parsed'][0]['food']
    food_data
  end

  def food_exist_in_db?(query)
    @foods.where("name LIKE ?", "%#{query}%").exists?
  end
end


  
  