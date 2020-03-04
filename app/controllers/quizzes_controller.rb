class QuizzesController < ApplicationController
  skip_before_action :authenticated, only: [:index]
 
  def index
    @quizzes = Quiz.all
  end



  def new
    @questions = Question.all
    @quiz = Quiz.new
  end



  def show

    @quiz = Quiz.find(params[:id])

    if @quiz.teacher?(current_user)
      render 'teacher_show'
    else
      # first visit? enroll as a student
      if !@quiz.student?(current_user)
        @quiz.participate(current_user)
      end
      @participant = @quiz.participant(current_user)
      render 'student_show'
    end

  end


  def create
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
      @quiz.assign_teacher_role(current_user)
      redirect_to quiz_path(@quiz)
    else 
      flash[:errors] = @quiz.errors.full_messages
      redirect_to new_quiz_path
    end 
  end 



  def edit
    @quiz = Quiz.find(params[:id])
  end

  def update 
    if @quiz.update
      redirect_to quiz_path(@quiz)
    else 
      flash[:errors] = @quiz.errors.full_messages
      redirect_to new_quiz_path
    end 
  end 

  def quiz_params
    params.require(:quiz).permit(:title , :description ,:question_ids)
  end 
end
