class SearchController<ApplicationController

  require 'net/http'
  require 'json'
  def index
    @foods = Food.all
    if params[:query].present?
    search_food(params[:query])
    end
  end

  private
  def search_food(query)
    if food_exist_in_db?(query)
      handle_existing_food(query)
    else
      handle_new_food(query)
    end
  end
  def handle_existing_food(query)
    @food = @foods.where("name LIKE ?", "%#{query}%").first
    redirect_to foods_show_path(@food)
  end

  def handle_new_food(query)
    food_data = ApiCallHelper.get_food_data(query)
    if food_data.present?
      @food = Food.create_food_if_not_exist(food_data)
      redirect_to foods_show_path(@food)
    else
      redirect_to root_path, notice: "Food named #{query} doesn't exist"
    end
  end
  def food_exist_in_db?(query)
    @foods.exists?(["name LIKE ?", "%#{query}%"])
  end

end