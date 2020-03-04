class QuizzesController < ApplicationController
  def index
    @quizzes = Quiz.all
  end

  def new
    @questions = Question.all
    @quiz = Quiz.new
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  def create 
    @quiz = Quiz.new
    if @quiz.valid?
      @quiz.save
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
    params.require(:quiz).permit(:title , :description ,question_id: [])
  end 
end
