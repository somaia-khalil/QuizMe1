class Participant < ApplicationRecord
    belongs_to :user
    belongs_to :quiz
    has_many :results
    has_many :answers , through: :results
end
