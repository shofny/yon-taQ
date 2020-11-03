class QuizzesController < ApplicationController

  def index

  end
  
  def new
    @quiz = Quiz.new
    @quiz.choices.build
    # 4.times{@quiz.choices.build}
  end

  def create
  @quiz = Quiz.new(quiz_params)
  @quiz.save
  redirect_to root_path

    
  end

  private

  def quiz_params
    params.require(:quiz).permit(:quiz,choices_attributes:[:choice, :answer_is]).merge(user_id: current_user.id)
  end

end
