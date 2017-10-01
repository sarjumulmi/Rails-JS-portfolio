class SurveyPolicy <  ApplicationPolicy

  def show?
    record.creator == user && record.published? == false
  end

  def show_stat?
    record.creator == user && record.published? == true
  end

  class Scope < Scope
    def resolve
        scope.where(creator: user).or(scope.where(status: true))
    end
  end

end
