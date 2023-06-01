class User < ApplicationRecord
    has_secure_password
    has_many :meal_plans

    validates :email, presence: true, format: {with: /\A[^@\s]+@[^@\s]+\z/ , message: "Must be a valid email adress!"}
end
