class SubmissionsController < ApplicationController
  before_action :authenticate_user!
  before_action :allQuestionAnswered?, :only => [:create]
  before_action :set_survey, :only => [:new, :create]

  def new
    @submission = @survey.submissions.build
  end

  def create
    # raise params.inspect
    # "submission"=>{
      # "answer_choice_ids"=>["", "2", "", "5", "", "9", "", "12", "", "15", "", "17"]
    # },
    # "survey_id"=>"3"
    @submission = @survey.submissions.build
    @submission.submitter = current_user
    @submission.build_from_answer_choice(params[:submission][:answer_choice_ids])

    if @submission.save
      redirect_to root_path, :notice => "Survey sucessfully submitted."
    else
      render "surveys/take_survey"
    end
  end

  private

  def allQuestionAnswered?

    if allUnanswered?
      redirect_to survey_take_survey_path(@survey), alert: 'Please answer all questions.'
    end
  end

  def allUnanswered?
    # raise params.inspect
    @survey = Survey.find(params[:survey_id])
    @survey.questions.any? do |question|
      # raise question.inspect
      question.answer_choices.all? do |ac|
        !params[:submission][:answer_choice_ids].include?(ac.id.to_s)
      end
    end

  end

  def set_survey
    @survey = Survey.find(params[:survey_id])
  end


end
