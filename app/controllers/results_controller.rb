class ResultsController < ApplicationController
  def index
    @results = Result.all
  end

  def new
    @result = Result.new 
  end

  def show
    @result = Result.find(params[:id])
  end

  def create
    @result = Result.new(result_params)
    if @result.valid?
      @result.save
      redirect_to new_result_path 
    else 
      # byebug
    end
  end

  private 
  def result_params
    params.require(:result).permit(:id, :participant_id, :answer_id, :question_id)
  end


end
