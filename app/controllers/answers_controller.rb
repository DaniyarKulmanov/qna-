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

  def destroy
    @question = Question.find { params[:question_id] }
    @answer = @question.answers.find(params[:id])

    if @answer.author == current_user
      @answer.destroy
      redirect_to question_path(@answer.question)
    else
      redirect_to question_path(@answer.question), notice: 'Only authored answers allowed for deletion'
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end
end
