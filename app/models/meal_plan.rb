class MealPlan < ApplicationRecord
  belongs_to :user
  has_many :foods

  validates :user_id, presence: true
end
