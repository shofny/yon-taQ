class QuizzesController < ApplicationController

  def index

  end
  
  def new
    @quiz = Quiz.new
    4.times{ @quiz.choices.build }
  end

  def create
    binding.pry
  @quiz = Quiz.new(quiz_params)
    if @quiz.save
    redirect_to root_path
    else
    render :new
    end
    
  end

  private

  def quiz_params
    params.require(:quiz).permit(:quiz,choices_attributes:[:choice, :answer_is]).merge(user_id: current_user.id)
  end

end
