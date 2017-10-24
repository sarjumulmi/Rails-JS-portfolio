class SurveysController < ApplicationController
  before_action :set_survey, :only=> [:show, :update, :edit, :destroy, :show_stat, :publish]
  before_action :authenticate_user!, :only => [:show, :new, :create, :edit, :update, :destroy]

  def index
    @surveys = policy_scope(Survey)
    @survey = Survey.new
  end

  def new
    @survey = current_user.created_surveys.build
    @question = @survey.questions.build
    3.times { @question.answer_choices.build}
  end

  def create
    @survey = Survey.new(survey_params)
    @survey.creator = current_user
    if @survey.save
      redirect_to edit_survey_path(@survey)
    else
      render 'new', :notice => "Save Unsuccessful"
    end
  end

  def edit
    authorize @survey, :show?
  end

  def show
    authorize @survey
    # binding.pry
  end

  def update
    if @survey.update_attributes(survey_params)
      redirect_to survey_path(@survey)
    else
      render @survey, :notice => "Update Unsuccessful."
    end
  end

  def destroy
    authorize @survey
    @survey.destroy
    redirect_to root_path, :notice => "Survey deleted!"
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
    params.require(:survey).permit(:title, :description, :questions_attributes => [:id, :_destroy, :question_text, :survey_id, :answer_choices_attributes =>[:id, :_destroy, :answer_text, :question_id]])
  end


end
