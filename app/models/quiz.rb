class Quiz < ApplicationRecord
    has_many :questions
    has_many :participants
    has_many :users , through: :participants

    validates :title, presence: true, :length => {:minimum => 1}
    validates :description, presence: true, :length => {:minimum => 1}



    def role (user)
      participant = self.participants.find_by(user_id: user.id)
      if  participant 
        participant.role
      else 
        nil
      end 
    end 

    def teacher?(user)
       user_role = self.role(user)
       !!user_role && user_role == "teacher"
    end 

    def student?(user)
        user_role = self.role(user)
        !!user_role && user_role == "student"
    end 


   def assign_teacher_role(user)
     # sets user as a teacher upon quiz creation / does not check for existing student status etc.
     Participant.create(quiz_id: self.id, user_id: user.id, role: "teacher")
   end

   def participate(user)
        # a user want to participant in this quiz and he is not a teacher nor a student, method to sign up to this quiz
       Participant.create(quiz_id: self.id, user_id: user.id, role: "student")
   end

   def participant(user)
    # returns the participant object of a user
    self.participants.find_by(user_id: user.id)
  end

  def next_question(user)
     # hopefully finds the first question that is unanswered / nil if none found
     user_participant = participant(user)
     remaining_ids = self.question_ids - user_participant.results.pluck(:question_id)

    #  user_questions   = user_participant.results.where(question_id: self.questions)
    #  last_question_id = !user_questions.empty? ? user_questions.last.id : -1
    #  outstanding_questions = self.questions.where("id > ?" , last_question_id)
      if !remaining_ids.empty?
        Question.find(remaining_ids.first)
      else
       nil
     end
  end






end
