class Question < ApplicationRecord
    has_many :answers
    belongs_to :quiz

    validates :question_title, presence: true, :length => {:minimum => 1}
    validates :question_text, presence: true, :length => {:minimum => 1}
end
