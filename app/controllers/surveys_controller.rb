class SurveysController < ApplicationController
  before_action :set_survey, :only=> [:show, :update, :edit, :destroy, :show_stat, :publish]
  before_action :authenticate_user!, :only => [:show, :new, :create, :edit, :update, :destroy]


  def index
    @surveys = policy_scope(Survey)
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
      render 'new'
    end
  end

  def show
    authorize @survey
    # binding.pry
  end


  def show_stat
    # raise params.inspect
    # pass the count hash for answer {text : count}
    authorize @survey, :show_stat?
  end

  def publish
    authorize @survey, :show?
    @survey.update_attributes(:status => true)
    redirect_to root_path, :notice => "Survey successfully published."
  end

  private
  def set_survey
    @survey = Survey.find(params[:id])
  end

  def survey_params
    params.require(:survey).permit(:title, :description)
  end


end
