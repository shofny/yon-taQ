class UsersController < ApplicationController

def show
  user = User.find(params[:id])
  @quiz = user.quizzes
  # binding.pry

end


end
