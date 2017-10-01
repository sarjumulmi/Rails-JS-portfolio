module SurveysHelper

  def button_take_survey(survey)
    link_to_if(user_signed_in?, "Take Survey", survey_take_survey_path(survey), :class => "btn btn-primary btn-sm")
  end

  def button_edit_survey(survey)
    if user_signed_in? && survey.creator == current_user
      link_to("Edit Survey", survey_path(survey), :class => "btn btn-primary btn-sm")
    end
  end

  def button_survey_stat(survey)
    if user_signed_in? && survey.creator == current_user
      link_to("View Stat", survey_show_stat_path(survey), :class => "btn btn-primary btn-sm")
    end
  end

  def button_create_survey(survey)
    link_to_if(user_signed_in?, "Add New Survey", new_survey_path(@survey), :class => "btn btn-primary btn-lg")
  end

end
