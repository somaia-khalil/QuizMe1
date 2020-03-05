class QuestionsController < ApplicationController

  
  def show
    @question = Question.find(params[:id])
  end
  
  def new
    @quizzes = Quiz.all
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to request.referrer
    else 
      flash[:errors] = @question.errors.full_messages
      redirect_to request.referrer
    end
  end

  def edit
    @quizzes = Quiz.all
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to request.referrer
    else 
      flash[:errors] = @question.errors.full_messages
      redirect_to request.referrer
    end 
  end 

  def question_params
    params.require(:question).permit(:question_title, :question_text, :type , :image_url , :quiz_id)
  end 
end
