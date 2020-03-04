class ParticipantsController < ApplicationController
  def index
    @participants = Participant.all
  end

  def new
    @participant = Participant.new 
  end

  def show
    @participant = Participant.find(params[:id])
  end

  def edit
  end
end
