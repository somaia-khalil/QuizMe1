class User < ApplicationRecord
    has_secure_password
    has_many :participants
    has_many :quizzes , through: :participants

    validates :nick_name, presence: true, uniqueness: true,:length => {:minimum => 1}

end
