class PlaysController < ApplicationController

  def index
    @rand_quiz = Quiz.order("RAND()").limit(3)
    session[:rand_quiz] = @rand_quiz
    session[:quiz_no] = 0
    session[:correct_num] = 0
  end

  def anwser
  
    session[:anwser] = params[:anwser].to_i
    # quiz_no = params[:quiz_no].to_i
    # # @correct_num = params[:corrct_num].to_i
    # @rand_quiz = params[:rand_quiz].split(" ").map(&:to_i)
    session[:quiz_no] += 1
    if session[:quiz_no] >= 3
      redirect_to result_plays_path
    else
      @quizzes = session[:rand_quiz][session[:quiz_no]]
    end

  end

  def result
  end

end
