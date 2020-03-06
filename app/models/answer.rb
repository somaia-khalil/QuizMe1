class Answer < ApplicationRecord
    belongs_to :question
    has_many :results
    has_many :participants , through: :results

    validates :points, presence: true
    validates :answer_text, presence: true, :length => {:minimum => 1}
end
