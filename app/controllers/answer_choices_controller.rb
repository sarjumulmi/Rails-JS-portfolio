class AnswerChoicesController < ApplicationController
  before_action :authenticate_user!

  def new
    if params[:question_id]
      @question = Question.find(params[:question_id])
      @survey = @question.survey
      @answer_choice = @question.answer_choices.build
      authorize @answer_choice
      # raise @question.inspect
    end
  end

  def create

    if params[:question_id]
      @question = Question.find(params[:question_id])
      @answer_choice = @question.answer_choices.build(answer_choice_params)
      if @answer_choice.save
        redirect_to survey_path(@question.survey)
      else
        @survey = @question.survey
        render "answer_choices/new"
      end
    end
  end

  private
  def answer_choice_params
    params.require(:answer_choice).permit(:answer_text)
  end
end
