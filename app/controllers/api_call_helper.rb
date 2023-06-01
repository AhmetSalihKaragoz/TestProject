class ApiCallHelper < ApplicationController
  def self.get_food_data(query)
    encoded_query = URI.encode_www_form_component(query)
    uri = URI("https://api.edamam.com/api/food-database/v2/parser?app_id=898c59ec&app_key=73118762a259e155defd241e556caf15&ingr=#{encoded_query}")
    response = Net::HTTP.get(uri)
    data = JSON.parse(response)
    food_data = data['parsed'][0]['food'] if data['parsed'] && data['parsed'][0] && data['parsed'][0]['food']
    food_data
  end
end
