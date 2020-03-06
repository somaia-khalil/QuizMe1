class ResultsController < ApplicationController

  def index
    @quizzes = Quiz.all_user_quizzes(current_user)
  end

  def new
    @result = Result.new 
  end

  def show
   
    @result = Result.find(params[:id])
  end

  def create
    @result = Result.new(result_params)
    if @result.save
      redirect_to request.referrer 
    else 
    end
  end

  private

  def result_params
    params.require(:result).permit( :participant_id, :answer_id, :question_id)
  end


end
