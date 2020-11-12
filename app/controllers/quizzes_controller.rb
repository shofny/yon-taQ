class QuizzesController < ApplicationController

  def index
    @total_quiz = Quiz.all
  end
  
  def new
    @quiz = Quiz.new
    4.times {@quiz.choices.build}
  end

  def create
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
    redirect_to root_path
    else
    render :new
    end
    
  end

  private

  def quiz_params
    quiz = params.require(:quiz).permit(:quiz,choices_attributes:[:choice]).merge(user_id: current_user.id)
    answer_c = quiz.permit(choices_attributes:[:choice])
    answer_c[:choices_attributes].each_key do |n|
      if n == params.require(:select_anwser)
        quiz[:choices_attributes]["#{n}"].merge!(answer_is: true)
      else
        quiz[:choices_attributes]["#{n}"].merge!(answer_is: false)
      end
    end

    return quiz
  end

end
