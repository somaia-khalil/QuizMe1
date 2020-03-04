class QuizzesController < ApplicationController
  skip_before_action :authenticated, only: [:index , :new, :create]
  def index
    
    user = current_user
    if user 
      @quizzes = user.quizzes
    else
      @quizzes = Quiz.all
    end
  end

  def new
    @questions = Question.all
    @quiz = Quiz.new
  end

  def show
    @quiz = Quiz.find(params[:id])
    @user = current_user 
    if @quiz.teacher?(current_user)
      render 'show'
    elsif @quiz.student?(current_user)
      @questions = @quiz.questions
    else
       @quiz.participate(current_user)
       render 'show'
    end
    @participant = @quiz.participant(current_user)

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
    params.require(:quiz).permit(:title , :description ,:question_id , answer_ids: [])
  end 
end
