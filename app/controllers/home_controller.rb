class HomeController<ApplicationController
    def index
        @foods = Food.all
        @food_q_result = @q.result(distinct: true)
        
        if params[:q].present? && params[:q][:name_i_cont_any].present?
            search_query = params[:q][:name_i_cont_any]
            @foods_q = @foods.where("name LIKE ?", "%#{search_query}%")
        end
    end
end