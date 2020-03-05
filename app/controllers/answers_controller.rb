class AnswersController < ApplicationController
  def index
  end

  def new

  end

  def create 
    @answer = Answer.new(answer_params)
    if @answer.valid?
      @answer.save
      redirect_to request.referrer
    else 
      flash[:errors] = @answer.errors.full_messages
      redirect_to request.referrer
    end
  end 

  def show
  end

  def edit
  end

  def answer_params
    params.require(:answer).permit(:answer_text , :points ,:question_id, :correct)
  end 
end
