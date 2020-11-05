class PlaysController < ApplicationController

  def index
    @rand_quiz = Quiz.order("RAND()").limit(3)
    # binding.pry
  end

  def anwser
    @anwser = params[:anwser].to_i
    quiz_no = params[:quiz_no].to_i
    rand_quiz = params[:rand_quiz].split(" ").map(&:to_i)
    q_no = quiz_no + 1
    if q_no == 4
      redirect_to root_path
    end
    binding.pry
    @quizzes = Quiz.find(rand_quiz[quiz_no + 1])
  end

end
