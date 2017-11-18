class SurveyPolicy <  ApplicationPolicy

  def show?
    record.creator == user
  end

  def show_stat?
    record.creator == user && record.published? == true
  end

  def destroy?
    record.creator == user
  end

  class Scope < Scope
    def resolve
        scope.where(creator: user).or(scope.where(status: true))
    end
  end

end
