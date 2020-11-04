class PlaysController < ApplicationController

  def index
    @quizzes = Quiz.all
    # @choices = Choice.all
  end

end
