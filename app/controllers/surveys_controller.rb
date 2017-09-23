class SurveysController < ApplicationController
  before_action :set_survey, :only=> [:show, :update, :edit, :destroy]

  def index
    @surveys = Survey.all
    @survey = Survey.new
  end

  def show
    @question = @survey.questions.build

  end

  def new
    @survey = Survey.new
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
