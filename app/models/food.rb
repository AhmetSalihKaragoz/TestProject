class Food < ApplicationRecord
    def self.ransackable_attributes(auth_object = nil)
        ["calories", "carbs", "created_at", "fat", "id", "name", "protein", "updated_at"]
    end

    def self.ransackable_associations(auth_object = nil)
        []
    end
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
