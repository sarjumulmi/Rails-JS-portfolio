module SurveysHelper

  def button_take_survey(survey)
    if user_signed_in? && survey.published?
      link_to("Take Survey", survey_take_survey_path(survey), :class => "btn btn-primary btn-sm")
    end
  end

  def button_edit_survey(survey)
    if user_signed_in? && survey.creator == current_user && !survey.published?
      link_to("Edit Survey", edit_survey_path(survey), :class => "btn btn-primary btn-sm")
    end
  end

  def button_delete_survey(survey)
    if user_signed_in? && survey.creator == current_user
      link_to("Delete Survey", survey, :method => :delete, data: {:confirm => "Are you sure?"}, :class => "btn btn-primary btn-sm")
    end
  end

  def button_survey_stat(survey)
    if user_signed_in? && survey.creator == current_user && survey.published?
      link_to("View Stat", survey_show_stat_path(survey), :class => "btn btn-primary btn-sm")
    end
  end

  def button_create_survey(survey)
    if user_signed_in?
      link_to("Add New Survey", new_survey_path(@survey), :class => "btn btn-primary btn-lg", :id =>"new-survey", :remote => true)
    end
  end

  def button_publish(survey)
    if !survey.published?
      link_to("Publish Survey", survey_publish_path(survey), :class => "btn btn-primary btn-info")
    end
  end

end
