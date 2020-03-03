class User < ApplicationRecord
    has_secure_password
    has_many :participants
    has_many :quizzes , through: :participants
end
