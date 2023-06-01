class Food < ApplicationRecord
    has_and_belongs_to_many :meal_plans

    validates :name, presence: true
    validates :calories, presence: true
    validates :carbs, presence: true
    validates :protein, presence: true
    validates :fat, presence: true
    def self.create_food_if_not_exist(food_data)
        Food.create(
          name: food_data['label'],
          calories: food_data['nutrients']['ENERC_KCAL'],
          protein: food_data['nutrients']['PROCNT'],
          carbs: food_data['nutrients']['CHOCDF'],
          fat: food_data['nutrients']['FAT']
        )
    end
end
