class QuizzesController < ApplicationController
  before_action :quiz_find, only: [:show, :edit, :update, :destroy]

  def index
    @total_quiz = Quiz.all
  end

  def new
    @quiz = Quiz.new
    4.times { @quiz.choices.build }
  end

  def create
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @quiz.update(quiz_update_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @quiz.destroy
    redirect_to root_path
  end

  private

  def quiz_params
    quiz = params.require(:quiz).permit(:quiz, choices_attributes: [:choice]).merge(user_id: current_user.id)
    answer_c = quiz.permit(choices_attributes: [:choice])
    answer_c[:choices_attributes].each_key do |n|
      if n == params.require(:select_anwser)
        quiz[:choices_attributes][n.to_s].merge!(answer_is: true)
      else
        quiz[:choices_attributes][n.to_s].merge!(answer_is: false)
      end
    end
    quiz
  end

  def quiz_update_params
    quiz = params.require(:quiz).permit(:quiz, choices_attributes: [:choice, :id]).merge(user_id: current_user.id)
    answer_c = quiz.permit(choices_attributes: [:choice])
    answer_c[:choices_attributes].each_key do |n|
      if n == params.require(:select_anwser)
        quiz[:choices_attributes][n.to_s].merge!(answer_is: true)
      else
        quiz[:choices_attributes][n.to_s].merge!(answer_is: false)
      end
    end
    quiz
  end

  def quiz_find
    @quiz = Quiz.find(params[:id])
  end
end
