class SubmissionsController < ApplicationController
  before_action :authenticate_user!

  def create
    # {"submission"=>
    #   {"survey_id"=>"3",
      # "answer_ids"=>["", "1", "", "4", "", "7", "", "11", "", "14", "", "16"]
    #   },
    # "question_ids"=>["4", "5", "6", "7", "12", "13"],
    # "commit"=>"Create Submission", "controller"=>"surveys", "action"=>"create_submission"}
    @survey = Survey.find(params[:submission][:survey_id])
    @submission = @survey.submissions.build
    @submission.submitter = current_user
    params[:submission][:answer_ids].reject{|a| a.empty?}.each do |answer_id|
      answer_text = AnswerChoice.find(answer_id).answer_text
      question_id = AnswerChoice.find(answer_id).question_id
      @submission.answers.build(:answer_text => answer_text, :question_id => question_id)
    end
    # raise @submission.inspect
    if @submission.save
      redirect_to survey_show_stat_path(@survey)
    else
      render "surveys/take_survey"
    end
  end
end
