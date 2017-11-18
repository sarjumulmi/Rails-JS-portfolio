class SurveySerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :creator_id, :nextSurvey, :previousSurvey
  has_many :questions

  def nextSurvey
    object.next.id if object.next
  end

  def previousSurvey
    object.previous.id if object.previous
  end

end
