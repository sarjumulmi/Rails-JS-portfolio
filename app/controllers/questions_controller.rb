class QuestionsController < ApplicationController
before_action :authenticate_user!

  def new
    if params[:survey_id]

      @survey = Survey.find(params[:survey_id])
      @question = @survey.questions.build
      # raise @question.inspect
      authorize @question
    end
  end

  def create
    if params[:survey_id]
      @survey = Survey.find(params[:survey_id])
      @question = @survey.questions.build(question_params)
      if @question.save
        redirect_to survey_path(@survey), :notice => "Question successfully created."
      else
        render 'new'
      end
    end
  end


  private
  def question_params
    params.require(:question).permit(:question_text)
  end
end
