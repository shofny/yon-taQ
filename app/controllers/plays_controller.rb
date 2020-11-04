class PlaysController < ApplicationController

  def index
  end

  def anwser
    @anwser = params[:anwser].to_i
    quiz_id = params[:quiz_id].to_i
    q_no = quiz_id + 1
    # if q_no == 6
    #   最終結果のページに飛ぶ
    # end
    @quizzes = Quiz.find(q_no)
  end

end
