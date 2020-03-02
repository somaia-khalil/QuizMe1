class User < ApplicationRecord
    has_many :participants
    has_many :quizzes , through: :participants
end
