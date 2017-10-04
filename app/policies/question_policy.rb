class QuestionPolicy < ApplicationPolicy

  def new?
    record.survey.creator == user && record.survey.published? == false
  end

end
