class AnswersController < ApplicationController
  before_action :authenticate_user!
  def create
    @question = Question.find { params[:question_id] }
    @answer = @question.answers.build(answer_params)
    @answer.author = current_user

    if @answer.save
      redirect_to @question
    else
      render "questions/show"
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end
end
