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
    # byebug
    if @result.valid?
      @result.save
      redirect_to request.referrer 
    else 
    end
  end

  private 
  def result_params
    params.require(:result).permit( :participant_id, :answer_id, :question_id)
  end


end
