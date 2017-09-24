class SurveysController < ApplicationController
  before_action :set_survey, :only=> [:show, :update, :edit, :destroy]
  before_action :authenticate_user!, :only => [:show, :new, :create]

  def index
    @surveys = Survey.all
    @survey = Survey.new
  end

  def show
    @question = @survey.questions.build
    @answer_choice = @question.answer_choices.build
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

  private
  def set_survey
    @survey = Survey.find(params[:id])
  end

  def survey_params
    params.require(:survey).permit(:title)
  end

end
