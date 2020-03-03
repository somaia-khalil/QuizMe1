class QuestionsController < ApplicationController

  
  def show
    @question = Question.find(params[:id])
  end
  
  def new
    @quizzes = Quiz.all
    @question = Question.new
  end

  def create
    @question = Question.new
    if @question.valid?
      @question.save
      redirect_to new_question_path
    else 
      flash[:errors] = @question.errors.full_messages
      redirect_to new_question_path
    end 
  end 
  def edit
    @quizzes = Quiz.all
    @question = Question.find(params[:id])
  end

  def update
    if @question.update
      redirect_to new_question_path
    else 
      flash[:errors] = @question.errors.full_messages
      redirect_to new_qustion_path
    end 
  end 

  def question_params
    params.require(:question).permit(:question_title, :question_text, :type , :image_url , :quiz_id)
  end 
end
