class SurveysController < ApplicationController
  before_action :set_survey, :only=> [:show, :update, :edit, :destroy, :show_stat]
  before_action :authenticate_user!, :only => [:show, :new, :create, :edit, :update, :destroy]
  before_action :isOwner?, :only=> [:show]

  def index
    @surveys = Survey.all
    @survey = Survey.new
  end

  def new
    @survey = current_user.created_surveys.build
  end

  def create
    @survey = Survey.new(survey_params)
    @survey.creator = current_user
    if @survey.save
      redirect_to @survey
    else
      render 'index'
    end
  end

  def show
    @question = @survey.questions.build
    @answer_choice = @question.answer_choices.build
  end

  def take_survey
    @survey = Survey.find(params[:id])
    @submission = @survey.submissions.build
  end

  def show_stat
    # raise params.inspect
    # pass the count hash for answer {text : count}
  end

  private
  def set_survey
    @survey = Survey.find(params[:id])
  end

  def survey_params
    params.require(:survey).permit(:title, :description)
  end

  def isOwner?
    if !(user_signed_in? && @survey.creator == current_user)
      redirect_to surveys_path, alert: 'Insufficient privilege.'
    end
  end


end
