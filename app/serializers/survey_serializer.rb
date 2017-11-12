class SurveySerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :creator_id
  # has_many :questions

end
