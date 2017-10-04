class AnswerChoicePolicy < ApplicationPolicy

  def new?
    record.question.survey.creator == user && record.question.survey.published? == false
  end

end
