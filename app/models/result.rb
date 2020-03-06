class Result < ApplicationRecord
    belongs_to :answer
    belongs_to :question
    belongs_to :participant


  def self.participant_results(participant)
    # give all results a participant scored at any quiz
    self.where(participant_id: participant.id)
  end 

  def self.quiz_results(participant, quiz)
    # gives a list of all results a participant scored at a certain quiz
    participant_results(participant).where(question_id: quiz.question_ids)
  end

  def self.quiz_score(participant, quiz)
    # calculates the total score the user achieved in a certain quiz
    quiz_results(participant, quiz).sum do |result|
      result.answer.points
    end
  end

  def self.quiz_score(participant, quiz)
    # calculates the total score the user achieved in a certain quiz
    quiz_results(participant, quiz).sum do |result|
      result.answer.points
    end
  end



end
