class Food < ApplicationRecord
    def self.ransackable_attributes(auth_object = nil)
        ["calories", "carbs", "created_at", "fat", "id", "name", "protein", "updated_at"]
    end

    def self.ransackable_associations(auth_object = nil)
        []
    end
end
