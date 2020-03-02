class Answer < ApplicationRecord
    belongs_to :question
    has_many :results
    has_many :participants , through: :results
end
