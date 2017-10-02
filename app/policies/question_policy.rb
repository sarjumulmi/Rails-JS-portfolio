class QuestionPolicy < ApplicationPolicy

  def new?
    record.survey.creator == user
  end

end
