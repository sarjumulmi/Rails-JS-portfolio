class QuestionsController < ApplicationController

  def new
    if params[:survey_id]
      @survey = Survey.find(params[:survey_id])
      @question = @survey.questions.build
      # raise @question.inspect
    end
  end

  def create
    if params[:survey_id]
      @survey = Survey.find(params[:survey_id])
      @question = @survey.questions.build(question_params)
      if @question.save
        redirect_to survey_path(@survey)
      end
    end
  end

  def index
    if params[:survey_id]
      @survey = Survey.find(params[:survey_id])
      @questions = @survey.questions
      @question = @survey.questions.build
    end
  end

  private
  def question_params
    params.require(:question).permit(:question_text)
  end
end
