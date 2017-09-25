class SurveysController < ApplicationController
  before_action :set_survey, :only=> [:show, :update, :edit, :destroy, :show_stat]
  before_action :authenticate_user!, :only => [:show, :new, :create, :edit, :update, :destroy]

  def index
    @surveys = Survey.all
    @survey = Survey.new
  end

  def new
    @survey = current_user.created_surveys.build
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      render 'show'
    else
      redirect_to surveys_path
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

  end

  private
  def set_survey
    @survey = Survey.find(params[:id])
  end

  def survey_params
    params.require(:survey).permit(:title)
  end

end
