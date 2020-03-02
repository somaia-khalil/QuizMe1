class Quiz < ApplicationRecord
    has_many :questions
    has_many :participants
    has_many :users , through: :participants
end
