class AnswerChoicePolicy < ApplicationPolicy

  def new?
    record.question.survey.creator == user
  end

end
